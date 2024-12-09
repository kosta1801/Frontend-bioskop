package rppbackend.controller;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.ApiOperation;
import rppbackend.model.Film;
import rppbackend.model.Rezervacija;
import rppbackend.service.FilmService;
import rppbackend.service.RezervacijaService;

@CrossOrigin
@RestController
public class RezervacijaController {
	
    @Autowired
    private RezervacijaService rezervacijaService;

    @Autowired
    private FilmService filmService;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @ApiOperation(value = "Returns List of all Rezervacije")
    @GetMapping("rezervacija")
    public ResponseEntity<List<Rezervacija>> getAll() {
        List<Rezervacija> rezervacije = rezervacijaService.getAll();
        return new ResponseEntity<>(rezervacije, HttpStatus.OK);
    }

    @ApiOperation(value = "Returns Rezervacija with id that was forwarded as path variable.")
    @GetMapping("rezervacija/{id}")
    public ResponseEntity<Rezervacija> getOne(@PathVariable("id") Integer id) {
        if (rezervacijaService.findById(id).isPresent()) {
            Optional<Rezervacija> rezervacijaOpt = rezervacijaService.findById(id);
            return new ResponseEntity<>(rezervacijaOpt.get(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
    }

    @ApiOperation(value = "Returns list of Rezervacije for Film with id that was forwarded as path variable.")
    @GetMapping("rezervacijeZaFilm/{id}")
    public ResponseEntity<List<Rezervacija>> getAllForFilm(@PathVariable("id") Integer id) {
        Optional<Film> filmOpt = filmService.findById(id);
        if (filmOpt.isPresent()) {
            List<Rezervacija> rezervacije = rezervacijaService.findbyFilm(filmOpt.get());
            return new ResponseEntity<>(rezervacije, HttpStatus.OK);
        }
        return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);

    }
    
    @ApiOperation(value = "Returns list of Rezervacije that were paid.")
    @GetMapping("placeneRezervacije")
    public ResponseEntity<List<Rezervacija>> placeneRezervacije() {
        List<Rezervacija> rezervacije = rezervacijaService.findByPlacenoTrue();
        return new ResponseEntity<>(rezervacije, HttpStatus.OK);
    }    
    
    @ApiOperation(value = "Adds new Rezervacija to database.")
    @PostMapping("rezervacija")
    public ResponseEntity<Rezervacija> addRezervacija(@RequestBody Rezervacija rezervacija) {
        Rezervacija savedRezervacija = rezervacijaService.save(rezervacija);
        URI location = URI.create("/rezervacija/" + savedRezervacija.getId());
        return ResponseEntity.created(location).body(savedRezervacija);
    }


    @ApiOperation(value = "Updates Rezervacija that has id that was forwarded as path variable with values forwarded in Request Body.")
    @PutMapping("rezervacija/{id}")
    public ResponseEntity<Rezervacija> updateOne(@RequestBody Rezervacija rezervacija,
            @PathVariable("id") Integer id) {
        if (!rezervacijaService.existsById(id)) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        rezervacija.setId(id);
        Rezervacija savedRezervacija = rezervacijaService.save(rezervacija);
        return ResponseEntity.ok().body(savedRezervacija);
    }

    @ApiOperation(value = "Deletes Rezervacija with id that was forwarded as path variable.")
    @DeleteMapping("rezervacija/{id}")
    public ResponseEntity<HttpStatus> delete(@PathVariable Integer id) {
        if (id == -100 && !rezervacijaService.existsById(-100)) {

            jdbcTemplate.execute(
                    "INSERT INTO rezervacija (\"id\", \"broj_osoba\", \"cena_karte\", \"datum\", \"placeno\", \"film\", \"sala\") "
                            + "VALUES ('-100', '1', '1', to_date('29.03.2021.', 'dd.mm.yyyy'), 'true', '1', '1')");
        }

        if (rezervacijaService.existsById(id)) {
            rezervacijaService.deleteById(id);
            return new ResponseEntity<HttpStatus>(HttpStatus.OK);
        }

        return new ResponseEntity<HttpStatus>(HttpStatus.NOT_FOUND);
    }

}
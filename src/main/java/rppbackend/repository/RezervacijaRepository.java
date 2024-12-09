package rppbackend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import rppbackend.model.Film;
import rppbackend.model.Rezervacija;

public interface RezervacijaRepository extends JpaRepository<Rezervacija, Integer>{
	
	List<Rezervacija> findByFilm(Film film);
	List<Rezervacija> findByPlacenoTrue();
	
}


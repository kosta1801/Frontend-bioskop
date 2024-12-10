package rppbackend.model;

import java.io.Serializable;
import java.lang.Boolean;
import java.lang.Integer;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: Rezervacija
 *
 */
@Entity
@Table(name = "rezervacija", schema = "public")
@NamedQuery(name="Rezervacija.findAll", query="SELECT r FROM Rezervacija r")
public class Rezervacija implements Serializable {

	   
	@Id
	@SequenceGenerator(name="REZERVACIJA_ID_GENERATOR", sequenceName="REZERVACIJA_SEQ", allocationSize=1)
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="REZERVACIJA_ID_GENERATOR")
	private Integer id;
	private Integer broj_osoba;
	private BigDecimal cena_karte;
	private Date datum;
	private Boolean placeno;
	
	@ManyToOne
	@JoinColumn(name="sala")
	private Sala sala;
	
	@ManyToOne
	@JoinColumn(name="film")
	private Film film;
	
	private static final long serialVersionUID = 1L;

	public Rezervacija() {
		super();
	}   
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}   
	public Integer getBroj_osoba() {
		return this.broj_osoba;
	}

	public void setBroj_osoba(Integer broj_osoba) {
		this.broj_osoba = broj_osoba;
	}   
	public BigDecimal getCena_karte() {
		return this.cena_karte;
	}

	public void setCena_karte(BigDecimal cena_karte) {
		this.cena_karte = cena_karte;
	}   
	public Date getDatum() {
		return this.datum;
	}

	public void setDatum(Date datum) {
		this.datum = datum;
	}   
	public Boolean getPlaceno() {
		return this.placeno;
	}

	public void setPlaceno(Boolean placeno) {
		this.placeno = placeno;
	}   
	public Film getFilm() {
		return this.film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}   
	public Sala getSala() {
		return this.sala;
	}

	public void setSala(Sala sala) {
		this.sala = sala;
	}
   
}

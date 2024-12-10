package rppbackend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import rppbackend.model.Sala;
import rppbackend.model.Bioskop;

public interface SalaRepository extends JpaRepository<Sala, Integer> {

    List<Sala> findByBioskop(Bioskop bioskop);

}

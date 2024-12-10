----------- bioskop -----------------------------------------------------

INSERT INTO "bioskop"("id", "naziv", "adresa") VALUES(nextval('bioskop_seq'), 'Arena Cineplex', 'Bulevar Mihajla Pupina 3, Novi Sad 21000');
INSERT INTO "bioskop"("id", "naziv", "adresa") VALUES(nextval('bioskop_seq'), 'Cineplexx Promenada', 'Bulevar oslobodjenja 119, Novi Sad 21000');
INSERT INTO "bioskop"("id", "naziv", "adresa") VALUES(nextval('bioskop_seq'), 'CineStar Novi Sad 4DX', 'Sentandrejski put 11, Novi Sad 21000');
INSERT INTO "bioskop"("id", "naziv", "adresa") VALUES(nextval('bioskop_seq'), 'Kulturni centar Novog Sada', 'Katolicka porta 5, Novi Sad 21101');


----------- film -----------------------------------------------------

INSERT INTO "film"("id", "naziv", "recenzija", "trajanje", "zanr") VALUES(nextval('film_seq'), 'Pastanjan i tri njusketara', 5, 89, 'Animirani');
INSERT INTO "film"("id", "naziv", "recenzija", "trajanje", "zanr") VALUES(nextval('film_seq'), '65', 6, 93, 'Triler');
INSERT INTO "film"("id", "naziv", "recenzija", "trajanje", "zanr") VALUES(nextval('film_seq'), 'Krid III', 7, 116, 'Drama');
INSERT INTO "film"("id", "naziv", "recenzija", "trajanje", "zanr") VALUES(nextval('film_seq'), 'Indigo Kristal', 8, 105, 'Drama');
INSERT INTO "film"("id", "naziv", "recenzija", "trajanje", "zanr") VALUES(nextval('film_seq'), 'Ne daj boze brak', 4, 95, 'Komedija');
INSERT INTO "film"("id", "naziv", "recenzija", "trajanje", "zanr") VALUES(nextval('film_seq'), 'Covek po imenu Oto', 7, 126, 'Komedija');
INSERT INTO "film"("id", "naziv", "recenzija", "trajanje", "zanr") VALUES(nextval('film_seq'), 'Vrisak 6', 7, 123, 'Horor');
INSERT INTO "film"("id", "naziv", "recenzija", "trajanje", "zanr") VALUES(nextval('film_seq'), 'Avatar: Put vode', 9, 190, 'Naucna-fantastika');
INSERT INTO "film"("id", "naziv", "recenzija", "trajanje", "zanr") VALUES(nextval('film_seq'), 'Dzon Vik 4', 8, 169, 'Akcioni');
INSERT INTO "film"("id", "naziv", "recenzija", "trajanje", "zanr") VALUES(nextval('film_seq'), 'Nova igracka', 6, 112, 'Komedija');
INSERT INTO "film"("id", "naziv", "recenzija", "trajanje", "zanr") VALUES(nextval('film_seq'), 'Asteriks i Obeliks: Srednje kraljevstvo', 5, 112, 'Avantura');
INSERT INTO "film"("id", "naziv", "recenzija", "trajanje", "zanr") VALUES(nextval('film_seq'), 'Dungeons & Dragons: Odanost medju lopovima', 9, 134, 'Fantazija');
INSERT INTO "film"("id", "naziv", "recenzija", "trajanje", "zanr") VALUES(nextval('film_seq'), 'Vatreno srce', 6, 92, 'Animirani');
INSERT INTO "film"("id", "naziv", "recenzija", "trajanje", "zanr") VALUES(nextval('film_seq'), 'Bas super', 6, 76, 'Avantura');


----------- sala -----------------------------------------------------

INSERT INTO "sala"("id", "kapacitet", "broj_redova", "bioskop") VALUES (nextval('sala_seq'), 82, 10, 1);
INSERT INTO "sala"("id", "kapacitet", "broj_redova", "bioskop") VALUES (nextval('sala_seq'), 120, 10, 1);
INSERT INTO "sala"("id", "kapacitet", "broj_redova", "bioskop") VALUES (nextval('sala_seq'), 280, 14, 1);
INSERT INTO "sala"("id", "kapacitet", "broj_redova", "bioskop") VALUES (nextval('sala_seq'), 76, 9, 2);
INSERT INTO "sala"("id", "kapacitet", "broj_redova", "bioskop") VALUES (nextval('sala_seq'), 100, 10, 2);
INSERT INTO "sala"("id", "kapacitet", "broj_redova", "bioskop") VALUES (nextval('sala_seq'), 260, 14, 2);
INSERT INTO "sala"("id", "kapacitet", "broj_redova", "bioskop") VALUES (nextval('sala_seq'), 82, 7, 2);
INSERT INTO "sala"("id", "kapacitet", "broj_redova", "bioskop") VALUES (nextval('sala_seq'), 76, 9, 3);
INSERT INTO "sala"("id", "kapacitet", "broj_redova", "bioskop") VALUES (nextval('sala_seq'), 224, 14, 3);
INSERT INTO "sala"("id", "kapacitet", "broj_redova", "bioskop") VALUES (nextval('sala_seq'), 90, 10, 3);
INSERT INTO "sala"("id", "kapacitet", "broj_redova", "bioskop") VALUES (nextval('sala_seq'), 260, 14, 3);
INSERT INTO "sala"("id", "kapacitet", "broj_redova", "bioskop") VALUES (nextval('sala_seq'), 70, 7, 4);

----------- rezervacija -----------------------------------------------------

INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 2, 300, to_date('28.03.2023.', 'dd.mm.yyyy.'), true, 1, 1);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 3, 350, to_date('28.03.2023.', 'dd.mm.yyyy.'), true, 1, 4);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 1, 470, to_date('28.03.2023.', 'dd.mm.yyyy.'), false, 2, 8);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 5, 300, to_date('29.03.2023.', 'dd.mm.yyyy.'), false, 3, 12);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 3, 420, to_date('29.03.2023.', 'dd.mm.yyyy.'), true, 4, 2);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 2, 420, to_date('29.03.2023.', 'dd.mm.yyyy.'), false, 5, 5);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 4, 350, to_date('29.03.2023.', 'dd.mm.yyyy.'), true, 6, 9);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 1, 320, to_date('29.03.2023.', 'dd.mm.yyyy.'), true, 6, 3);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 2, 470, to_date('30.03.2023.', 'dd.mm.yyyy.'), false, 7, 6);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 4, 470, to_date('30.03.2023.', 'dd.mm.yyyy.'), true, 8, 10);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 3, 350, to_date('30.03.2023.', 'dd.mm.yyyy.'), false, 8, 7);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 2, 300, to_date('30.03.2023.', 'dd.mm.yyyy.'), true, 9, 11);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 3, 420, to_date('30.03.2023.', 'dd.mm.yyyy.'), false, 10, 3);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 1, 300, to_date('31.03.2023.', 'dd.mm.yyyy.'), true, 10, 5);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 5, 400, to_date('31.03.2023.', 'dd.mm.yyyy.'), false, 11, 11);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 2, 420, to_date('31.03.2023.', 'dd.mm.yyyy.'), false, 12, 1);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 4, 350, to_date('31.03.2023.', 'dd.mm.yyyy.'), true, 13, 12);
INSERT INTO "rezervacija"("id", "broj_osoba", "cena_karte", "datum", "placeno", "film", "sala") VALUES (nextval('rezervacija_seq'), 3, 400, to_date('31.03.2023.', 'dd.mm.yyyy.'), true, 14, 7);
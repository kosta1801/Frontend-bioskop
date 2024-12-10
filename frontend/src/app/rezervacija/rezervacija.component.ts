import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Observable } from 'rxjs/internal/Observable';
import { RezervacijaDialogComponent } from '../dialog/rezervacija-dialog/rezervacija-dialog.component';
import { Film } from '../model/film.model';
import { Sala } from '../model/sala.model';
import { RezervacijaService } from '../service/rezervacija.service';
import { Rezervacija } from './../model/rezervacija.model';

@Component({
  selector: 'app-rezervacija',
  templateUrl: './rezervacija.component.html',
  styleUrls: ['./rezervacija.component.css']
})
export class RezervacijaComponent {

  displayedColumns = ['id', 'broj_osoba', 'cena_karte', 'datum', 'placeno', 'film', 'sala', 'actions'];

 //dataSource!: Observable<Rezervacija[]>;
 dataSource!: MatTableDataSource<Rezervacija>;

  today: Date = new Date();

  film!: Film;

  sala!: Sala;

  @ViewChild(MatPaginator)
  paginator!: MatPaginator;

  @ViewChild(MatSort)
  sort!: MatSort;

  @Input()
  selektovanFilm!: Film;

  constructor(public rezervacijaService: RezervacijaService,
    public dialog: MatDialog) { }

  ngOnInit(): void {
    this.loadData();
  }

  ngOnChanges(): void {
    if(this.selektovanFilm.id) {
      this.loadData();
    }
  }

  public loadData(){
    //this.dataSource = this.rezervacijaService.getRezervacije(this.selektovanFilm.id);
    this.rezervacijaService.getRezervacijeZaFilm(this.selektovanFilm.id).subscribe( data => {
      this.dataSource = new MatTableDataSource(data);

      this.dataSource.sortingDataAccessor = (data:any, property) =>{
        switch(property){
          case 'id': return data[property];
          case 'broj_osoba': return data[property];
          case 'cena_karte': return data[property];
          case 'datum': return data[property];
          case 'placeno': return data[property];
          default: return data[property].toLocaleLowerCase();
        }
      };
      this.dataSource.paginator = this.paginator;
      this.dataSource.sort = this.sort;
    });
 }

  public openDialog(flag: number, id: number, broj_osoba: number, cena_karte: number, datum: Date, placeno: boolean, film: Film, sala: Sala) {
    const dialog = this.dialog.open(RezervacijaDialogComponent, {data: {id: id, broj_osoba: broj_osoba, cena_karte: cena_karte, datum: datum, placeno: placeno, film: film, sala: sala}});
    dialog.componentInstance.flag = flag;
    dialog.afterClosed().subscribe(result => {
      if (result === 1) {
        this.loadData();
      }
    })
  }

  applyFilter(filterValue: string) {
    filterValue.trim();
    filterValue = filterValue.toLowerCase();
    this.dataSource.filter = filterValue;
  }

}

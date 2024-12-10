import { Bioskop } from "./bioskop.model";

export class Sala {
  id!: number;
  kapacitet!: number;
  broj_redova!: number;
  bioskop!: Bioskop;
}
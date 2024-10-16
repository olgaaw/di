import { Component } from '@angular/core';
import {MatTableModule} from '@angular/material/table';


export interface Student {
  num: number;
  nombre: string;
  apellidos: string;
  nif: string;
  edad: number;
  curso: string;
}

const STUDENT_DATA: Student[] = [
  {num: 1, nombre: 'Juan', apellidos: 'Jimenez', nif: '123456789A', edad: 22, curso: 'DI'},
  {num: 2, nombre: 'Lola', apellidos: 'Garcia', nif: '123456789A', edad: 27, curso: 'SGE'},
  {num: 3, nombre: 'Luis', apellidos: 'Rodriguez', nif: '123456789A', edad: 18, curso: 'DI'},
  {num: 4, nombre: 'Jose', apellidos: 'Vega', nif: '123456789A', edad: 22, curso: 'DI'},
  {num: 5, nombre: 'David', apellidos: 'Morilla', nif: '123456789A', edad: 26, curso: 'DI' },
];

@Component({
  selector: 'app-table',
  styleUrl: './table.component.css',
  templateUrl: './table.component.html',
  standalone: true,
  imports: [MatTableModule],
})

export class TableComponent {
  displayedColumns: string[] = ['num', 'nombre', 'apellidos', 'nif', 'edad', 'curso'];
  studentData = STUDENT_DATA;
}

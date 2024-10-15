import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-car-component',
  templateUrl: './car-component.component.html',
  styleUrl: './car-component.component.css'
})
export class CarComponentComponent implements OnInit {
modelo = '';
tipo = '';
precio =  '';

  ngOnInit(): void {
    this.modelo = 'Tesla Modelo X';
    this.tipo = 'Automatico';
    this.precio = '$298/day';
    
  }

}

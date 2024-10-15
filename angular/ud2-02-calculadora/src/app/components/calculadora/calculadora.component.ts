import { Component } from '@angular/core';

@Component({
  selector: 'app-calculadora',
  templateUrl: './calculadora.component.html',
  styleUrl: './calculadora.component.css'
})
export class CalculadoraComponent {

  operacion = '';

  sumar() {
    this.operacion += ' + ';
  }

  restar() {
    this.operacion += ' - ';
  }

  addNum(num: number | string) {
    this.operacion += num;
  }

  borrar() {
    this.operacion = '';
  }

  borrarUltimo() {
    this.operacion = this.operacion.slice(0, -1);
  }

  calcular() {
    this.operacion = eval(this.operacion).toString();

  }


}

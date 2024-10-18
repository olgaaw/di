import { Component } from '@angular/core';
import { Vehiculo } from '../../vehiculo.interface';
import { VehiculosService } from '../../services/vehiculos.service.service';

@Component({
  selector: 'app-lista-vehiculos',
  templateUrl: './lista-vehiculos.component.html',
  styleUrl: './lista-vehiculos.component.css'
})
export class ListaVehiculosComponent {
  listadoVehiculos: Vehiculo[] = [];

  constructor(private vehiculosService: VehiculosService) {}
  

  ngOnInit(): void {
    this.vehiculosService.getVehiculoList().subscribe(respuesta => {
        this.listadoVehiculos = respuesta.results; 
    });

  }

  getVehiculoId(url: string): number {
    var id = url.slice(31,32);
    return parseInt(id);
  }

  getVehiculoImage(id : number) {
    return `https://starwars-visualguide.com/assets/img/vehicles/${id}.jpg`;
  }
    
}

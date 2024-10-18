import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ListaVehiculo, Vehiculo } from '../vehiculo.interface';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class VehiculosService {

  constructor(private http: HttpClient) { }

  getVehiculoList(): Observable<ListaVehiculo> {
    return this.http.get<ListaVehiculo>('https://swapi.dev/api/vehicles');
  
  }

  

}

import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ListaVehiculoResponse, Vehiculo } from '../vehiculo.interface';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class VehiculosService {

  constructor(private http: HttpClient) { }

  getVehiculoList(): Observable<ListaVehiculoResponse> {
    return this.http.get<ListaVehiculoResponse>('https://swapi.dev/api/vehicles');
  
  }

  

}

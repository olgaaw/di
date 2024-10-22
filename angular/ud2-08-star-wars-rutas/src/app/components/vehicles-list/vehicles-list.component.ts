import { Component, OnInit } from '@angular/core';
import { Vehicle } from '../../models/vehicles-list.interface';
import { VehicleService } from '../../services/vehicle.service';

@Component({
  selector: 'app-vehicles-list',
  templateUrl: './vehicles-list.component.html',
  styleUrl: './vehicles-list.component.css',
})
export class VehiclesListComponent implements OnInit {
  vehicleList: Vehicle[] = [];

  constructor(private vehicleService: VehicleService) {}

  ngOnInit(): void {
    this.vehicleService.getVehicleList().subscribe(resp => {
      this.vehicleList = resp.results;
    });
  }

  getVehiculoId(url: string): number {
    var id = url.split('/')[5];
    return parseInt(id);
  }

  getVehiculoImage(id : number) {
    return `https://starwars-visualguide.com/assets/img/vehicles/${id}.jpg`;
    
  }
    
}
import { Component } from '@angular/core';
import { People } from '../../models/people-list.interface';
import { PeopleService } from '../../services/people.service';

@Component({
  selector: 'app-people-list',
  templateUrl: './people-list.component.html',
  styleUrl: './people-list.component.css'
})
export class PeopleListComponent {
  peopleList: People[] = [];

  constructor(private peopleService: PeopleService) {}

  ngOnInit(): void {
    this.peopleService.getPeopleList().subscribe(resp => {
      this.peopleList = resp.results;
    });
  }

  getPeopleId(url: string): number {
    var id = url.split('/')[5];
    return parseInt(id);
  }

  getPeopleImage(id : number) {
    return `https://starwars-visualguide.com/assets/img/characters/${id}.jpg`;
    
  }
    
}

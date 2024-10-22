import { Component } from '@angular/core';
import { CharactersService } from '../../services/characters.service';
import { Characters } from '../../models/character.interface';

@Component({
  selector: 'app-character-list',
  templateUrl: './character-list.component.html',
  styleUrl: './character-list.component.css'
})
export class CharacterListComponent {

  characterList: Characters[] = [];

  constructor(private charactersService: CharactersService) {}
  

  ngOnInit(): void {
    this.charactersService.getCharacterList().subscribe(respuesta => {
      this.characterList = respuesta.results; 
  });

  }


}

import { Component, OnInit } from '@angular/core';
import { PokemonService } from '../../services/pokemon.service';


@Component({
  selector: 'app-pokemon-battle',
  templateUrl: './pokemon-battle.component.html',
  styleUrls: ['./pokemon-battle.component.css']
})
export class PokemonBattleComponent implements OnInit {
  pokemon1: any;
  pokemon2: any;
  pokemon1Health: number = 100;
  pokemon2Health: number = 100;
  message: string = '';

  constructor(private pokemonService: PokemonService) {}

  ngOnInit(): void {
    var random1 = Math.floor(Math.random() * 648) + 1;
    var random2 = Math.floor(Math.random() * 648) + 1;
    
    this.pokemonService.getPokemon(random1).subscribe(response => { 
      this.pokemon1 = response; 
    });
    
    this.pokemonService.getPokemon(random2).subscribe(response => { 
      this.pokemon2 = response; 
    });
  }

  attack(pokemon: number): void {
    var damage = Math.floor(Math.random() * 20) + 1;
    if (pokemon == 1) {
      this.pokemon2Health -= damage;
      if (this.pokemon2Health <= 0){
        this.pokemon2Health = 0;
      }
      this.message = `${this.pokemon1.name} ataca a ${this.pokemon2.name} con ${damage} puntos de daño`;
    } else {
      this.pokemon1Health -= damage;
      if (this.pokemon1Health <= 0){
        this.pokemon1Health = 0;
      }
      this.message = `${this.pokemon2.name} ataca a ${this.pokemon1.name} con ${damage} puntos de daño`;
    }

    this.winner();
  }

  winner(): void {
    if (this.pokemon1Health <= 0) {
      this.message = `${this.pokemon2.name} ha ganado`;
    } else if (this.pokemon2Health <= 0) {
      this.message = `${this.pokemon1.name} ha ganado`;
    }
  }
}

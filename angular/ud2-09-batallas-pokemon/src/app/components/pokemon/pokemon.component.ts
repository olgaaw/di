import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-pokemon',
  templateUrl: './pokemon.component.html',
  styleUrls: ['./pokemon.component.css']
})
export class PokemonComponent {
  @Input() pokemon: any;
  @Input() health: number | undefined;
  @Output() attack = new EventEmitter<void>();

  onAttack(): void {
    this.attack.emit();
  }
}

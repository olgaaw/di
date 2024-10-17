import { Component } from '@angular/core';

export interface CountryPhone {
  name: string;
  flag: string;
  prefix: number[];
}

const COUNTRY_PEFIXES: CountryPhone[] =  [
  {name: 'Spain', flag: 'https://img.freeflagicons.com/thumb/round_icon/spain/spain_640.png', prefix: [34]},
  {}
]

@Component({
  selector: 'app-phone-prefix-list',
  templateUrl: './phone-prefix-list.component.html',
  styleUrl: './phone-prefix-list.component.css'
})
export class PhonePrefixListComponent {
getFlagImage(arg0: string) {
throw new Error('Method not implemented.');
}
  countryPhoneList = COUNTRY_PEFIXES;

}

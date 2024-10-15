import { Component } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {

  //1. Property binding (one way)
  valoracion = 5
  imgurl = 'https://upload.wikimedia.org/wikipedia/commons/9/90/Logo_Mercadona_%28color-300-alpha%29.png'

    // 2. Event binding (one way)
    showUserInfo() {
      throw new Error('Method not implemented.');
      }
      

    // 3. Two way data binding
    nombre = 'Olga'
}

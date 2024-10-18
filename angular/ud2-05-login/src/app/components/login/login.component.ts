import {ChangeDetectionStrategy, Component, signal} from '@angular/core';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent {
  email: string = '';
  password: string = '';

  onLogin(): void {
    console.log('Email:', this.email);
    console.log('Contraseña:', this.password);
  }

}



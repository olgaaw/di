import { Component } from '@angular/core';
import { UsuarioDto } from '../../models/usuario-dto';

@Component({
  selector: 'app-formulario-registro',
  templateUrl: './formulario-registro.component.html',
})
export class FormularioRegistroComponent {
  usuario = new UsuarioDto('','', undefined , '', undefined, '', '', '', '')
  letraNIF: string = '';
  mensajeError: string = '';


  calcularLetraNIF() {
    const letras = 'TRWAGMYFPDXBNJZSQVHLCKE';

    var numero = this.usuario.nif;

    this.letraNIF = letras[numero! % 23];
    
  }


  validarFormulario(): boolean {
    if (
      !this.usuario.nombre ||
      !this.usuario.apellidos ||
      !this.usuario.nif ||
      !this.usuario.email ||
      !this.usuario.telefono ||
      !this.usuario.sexo ||
      !this.usuario.conocidoPor ||
      !this.usuario.password ||
      !this.usuario.confirmPassword ||
      !this.usuario.terminos
    ) {
      this.mensajeError = 'Campos incompletos';
      return false;
    }

    if (this.usuario.password != this.usuario.confirmPassword) {
      this.mensajeError = 'Las contraseñas no coinciden';
      return false;
    }

    this.mensajeError = '';
    return true;
  }


  onSubmit() {
    if (this.validarFormulario()) {
      console.log("Datos del formulario:", this.usuario);
    }

  }
}

import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { ListaVehiculosComponent } from './components/lista-vehiculos/lista-vehiculos.component';
import { HttpContext, provideHttpClient } from '@angular/common/http';

@NgModule({
  declarations: [
    AppComponent,
    ListaVehiculosComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule
  ],
  providers: [provideHttpClient()],
  bootstrap: [AppComponent]
})
export class AppModule { }

import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';

import { DashboardGradComponent } from './dashboard-grad.component';
import { DashboardGradRoutingModule } from './dashboard-grad-routing.module';

@NgModule({
  imports: [
    FormsModule,
    CommonModule,
    ChartsModule,
    BsDropdownModule,
    DashboardGradRoutingModule,
    ButtonsModule.forRoot()
  ],
  declarations: [ DashboardGradComponent ]
})
export class DashboardGradModule { }

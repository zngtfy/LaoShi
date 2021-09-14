import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';

import { DashboardAdminComponent } from './dashboard-admin.component';
import { DashboardAdminRoutingModule } from './dashboard-admin-routing.module';

@NgModule({
  imports: [
    FormsModule,
    ChartsModule,
    BsDropdownModule,
    DashboardAdminRoutingModule,
    ButtonsModule.forRoot()
  ],
  declarations: [ DashboardAdminComponent ]
})
export class DashboardAdminModule { }

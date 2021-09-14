import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { ToastrModule } from 'ngx-toastr';
import { PaginationModule } from 'ngx-bootstrap/pagination';
import { DashboardTeacherComponent } from './dashboard-teacher.component';
import { DashboardTeacherRoutingModule } from './dashboard-teacher-routing.module';

@NgModule({
  imports: [
    FormsModule,
    ChartsModule,
    CommonModule,
    BsDropdownModule,
    DashboardTeacherRoutingModule,
    ToastrModule.forRoot(),
    PaginationModule.forRoot(),
    ButtonsModule.forRoot()
  ],
  declarations: [ DashboardTeacherComponent ]
})
export class DashboardTeacherModule { }

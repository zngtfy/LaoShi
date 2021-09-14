import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { ToastrModule } from 'ngx-toastr';
import { ModalModule } from 'ngx-bootstrap/modal';

import { MycourseStudentListComponent } from './mycourse-student-list.component';

const routes: Routes = [
    { path: '', component: MycourseStudentListComponent, pathMatch: 'full' }
];

@NgModule({
  imports: [
    FormsModule,
    ChartsModule,
    CommonModule,
    BsDropdownModule,
    ButtonsModule.forRoot(),
    ToastrModule.forRoot(),
    ModalModule.forRoot(),
    RouterModule.forChild(routes)
  ],
  declarations: [ MycourseStudentListComponent ]
})
export class MycourseStudentListModule { }

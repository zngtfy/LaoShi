import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { ToastrModule } from 'ngx-toastr';

import { MycourseTeacherComponent } from './mycourse-teacher.component';

const routes: Routes = [
    { path: '', component: MycourseTeacherComponent, pathMatch: 'full' }
];

@NgModule({
  imports: [
    FormsModule,
    CommonModule,
    ChartsModule,
    BsDropdownModule,
    ButtonsModule.forRoot(),
    ToastrModule.forRoot(),
    RouterModule.forChild(routes)
  ],
  declarations: [ MycourseTeacherComponent ]
})
export class MycourseTeacherModule { }

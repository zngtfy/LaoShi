import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { CollapseModule } from 'ngx-bootstrap/collapse';
import { ToastrModule } from 'ngx-toastr';

import { MycourseScoreComponent } from './mycourse-score.component';

const routes: Routes = [
    { path: '', component: MycourseScoreComponent, pathMatch: 'full' }
];

@NgModule({
  imports: [
    FormsModule,
    CommonModule,
    ChartsModule,
    BsDropdownModule,
    ButtonsModule.forRoot(),
    ToastrModule.forRoot(),
    CollapseModule.forRoot(),
    RouterModule.forChild(routes)
  ],
  declarations: [ MycourseScoreComponent ]
})
export class MycourseMaterialModule { }

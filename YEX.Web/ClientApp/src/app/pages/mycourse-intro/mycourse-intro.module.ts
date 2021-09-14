import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { ToastrModule } from 'ngx-toastr';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { MycourseIntroComponent } from './mycourse-intro.component';

const routes: Routes = [
    { path: '', component: MycourseIntroComponent, pathMatch: 'full' }
];

@NgModule({
  imports: [
    FormsModule,
    ChartsModule,
    BsDropdownModule,
    CommonModule,
    TabsModule,
    ButtonsModule.forRoot(),
    ToastrModule.forRoot(),
    RouterModule.forChild(routes)
  ],
  declarations: [ MycourseIntroComponent ]
})
export class MycourseIntroModule { }

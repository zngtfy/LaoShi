import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { CollapseModule } from 'ngx-bootstrap/collapse';
import { ModalModule } from "ngx-bootstrap";
import { ToastrModule } from 'ngx-toastr';
import { MycourseMaterialComponent } from './mycourse-material.component';
import { NgxDocViewerModule } from 'ngx-doc-viewer';

const routes: Routes = [
    { path: '', component: MycourseMaterialComponent, pathMatch: 'full' }
];

@NgModule({
  imports: [
    FormsModule,
    CommonModule,
    ChartsModule,
    BsDropdownModule,
    NgxDocViewerModule,
    ButtonsModule.forRoot(),
    CollapseModule.forRoot(),
    ModalModule.forRoot(),
    ToastrModule.forRoot(),
    RouterModule.forChild(routes)
  ],
  declarations: [ MycourseMaterialComponent ]
})
export class MycourseMaterialModule { }

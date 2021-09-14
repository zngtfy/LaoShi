import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { CollapseModule } from 'ngx-bootstrap/collapse';
import { ModalModule } from "ngx-bootstrap";
import { NgxFileDropModule } from 'ngx-file-drop';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { ToastrModule } from 'ngx-toastr';
import { MycourseAssigmentComponent } from './mycourse-assigment.component';

const routes: Routes = [
    { path: '', component: MycourseAssigmentComponent, pathMatch: 'full' }
];

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ChartsModule,
        BsDropdownModule,
        NgxFileDropModule,
        TabsModule,
        ButtonsModule.forRoot(),
        CollapseModule.forRoot(),
        ModalModule.forRoot(),
        ToastrModule.forRoot(),
        RouterModule.forChild(routes)
    ],
    declarations: [MycourseAssigmentComponent]
})
export class MycourseAssigmentModule { }

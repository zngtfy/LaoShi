import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { NgxFileDropModule } from 'ngx-file-drop';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { ToastrModule } from 'ngx-toastr';
import { ThesisStudentWorkComponent } from './thesis-student-work.component';
import { PaginationModule } from 'ngx-bootstrap/pagination';

const routes: Routes = [
    { path: '', component: ThesisStudentWorkComponent, pathMatch: 'full' }
];

@NgModule({
    imports: [
        FormsModule,
        ChartsModule,
        CommonModule,
        BsDropdownModule,
        NgxFileDropModule,
        TabsModule,
        ButtonsModule.forRoot(),
        ToastrModule.forRoot(),
        PaginationModule.forRoot(),
        RouterModule.forChild(routes)
    ],
    declarations: [ThesisStudentWorkComponent]
})
export class ThesisStudentWorkModule { }

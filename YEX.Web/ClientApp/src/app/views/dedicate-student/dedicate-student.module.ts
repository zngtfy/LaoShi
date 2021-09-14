import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
//import { ModalModule } from 'ngx-bootstrap/modal';

import { DedicateStudentComponent } from './dedicate-student.component';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { ToastrModule } from 'ngx-toastr';
import { ModalModule } from 'ngx-bootstrap/modal';

const routes: Routes = [
    { path: '', component: DedicateStudentComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [DedicateStudentComponent],
    imports: [
        CommonModule,
        FormsModule,
        Ng2SmartTableModule,
        ToastrModule.forRoot(),
        ModalModule.forRoot(),
        RouterModule.forChild(routes)
    ]
})

export class DedicateStudentModule { }
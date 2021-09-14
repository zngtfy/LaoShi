import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ToastrModule } from 'ngx-toastr';
//import { ModalModule } from 'ngx-bootstrap/modal';

import { StudyComponent } from './study.component';

const routes: Routes = [
    { path: '', component: StudyComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [StudyComponent],
    imports: [
        CommonModule,
        FormsModule,
        ToastrModule.forRoot(),
        RouterModule.forChild(routes)
    ]
})
export class StudyModule { }
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ToastrModule } from 'ngx-toastr';
//import { ModalModule } from 'ngx-bootstrap/modal';

import { ForgetPasswordComponent } from './forget-password';

const routes: Routes = [
    { path: '', component: ForgetPasswordComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [ForgetPasswordComponent],
    imports: [
        CommonModule,
        FormsModule,
        ToastrModule.forRoot(),
        RouterModule.forChild(routes)
    ]
})

export class ForgetPasswordModule { }
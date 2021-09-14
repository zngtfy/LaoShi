import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ToastrModule } from 'ngx-toastr';
//import { ModalModule } from 'ngx-bootstrap/modal';

import { ResetPasswordComponent } from './reset-password';

const routes: Routes = [
    { path: ':reminderToken', component: ResetPasswordComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [ResetPasswordComponent],
    imports: [
        CommonModule,
        FormsModule,
        ToastrModule.forRoot(),
        RouterModule.forChild(routes)
    ]
})

export class ResetPasswordModule { }
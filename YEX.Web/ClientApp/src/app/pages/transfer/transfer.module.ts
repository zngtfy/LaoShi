import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { AlertModule } from 'ngx-bootstrap/alert';
import { ToastrModule } from 'ngx-toastr';
//import { ModalModule } from 'ngx-bootstrap/modal';

import { TransferComponent } from './transfer.component';

const routes: Routes = [
    { path: '', component: TransferComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [TransferComponent],
    imports: [
        CommonModule,
        FormsModule,
        AlertModule.forRoot(),
        ToastrModule.forRoot(),
        RouterModule.forChild(routes)
    ]
})

export class TransferModule { }
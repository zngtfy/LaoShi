import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
//import { ModalModule } from 'ngx-bootstrap/modal';

import { ContactComponent } from './contact.component';

const routes: Routes = [
    { path: '', component: ContactComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [ContactComponent],
    imports: [
        CommonModule,
        FormsModule,
        RouterModule.forChild(routes)
    ]
})

export class ContactModule { }
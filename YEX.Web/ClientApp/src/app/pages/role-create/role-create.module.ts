import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { ToastrModule } from 'ngx-toastr';
import { PaginationModule } from 'ngx-bootstrap/pagination';

import { RoleCreateComponent } from './role-create.component';

const routes: Routes = [
    { path: '', component: RoleCreateComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [RoleCreateComponent],
    imports: [
        FormsModule,
        ChartsModule,
        CommonModule,
        BsDropdownModule,
        ButtonsModule.forRoot(),
        ToastrModule.forRoot(),
        PaginationModule.forRoot(),
        RouterModule.forChild(routes)
    ]
})

export class RoleCreateModule { }
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';

import { UserCreateComponent } from './user-create.component';

const routes: Routes = [
    { path: '', component: UserCreateComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [UserCreateComponent],
    imports: [
        CommonModule,
        FormsModule,
        RouterModule.forChild(routes)
    ]
})

export class UserCreateModule { }
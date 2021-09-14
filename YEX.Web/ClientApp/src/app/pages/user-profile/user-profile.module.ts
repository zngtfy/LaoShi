import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';

import { UserProfileComponent } from './user-profile.component';

const routes: Routes = [
    { path: '', component: UserProfileComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [UserProfileComponent],
    imports: [
        CommonModule,
        FormsModule,
        RouterModule.forChild(routes)
    ]
})

export class UserProfileModule { }
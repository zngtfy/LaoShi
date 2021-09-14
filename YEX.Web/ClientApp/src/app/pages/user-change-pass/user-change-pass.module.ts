import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';

import { UserChangePassComponent } from './user-change-pass.component';

const routes: Routes = [
    { path: '', component: UserChangePassComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [UserChangePassComponent],
    imports: [
        CommonModule,
        FormsModule,
        RouterModule.forChild(routes)
    ]
})

export class UserChangePassModule { }
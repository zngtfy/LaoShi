import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';

import { UserSearchComponent } from './user-search.component';

const routes: Routes = [
    { path: '', component: UserSearchComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [UserSearchComponent],
    imports: [
        CommonModule,
        RouterModule.forChild(routes)
    ]
})

export class UserSearchModule { }
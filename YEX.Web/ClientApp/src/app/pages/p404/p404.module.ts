import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';

import { P404Component } from './p404.component';

const routes: Routes = [
    { path: '', component: P404Component, pathMatch: 'full' }
];

@NgModule({
    declarations: [P404Component],
    imports: [
        CommonModule,
        FormsModule,
        RouterModule.forChild(routes)
    ]
})

export class P404Module { }
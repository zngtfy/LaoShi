import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CarouselModule } from 'ngx-bootstrap/carousel';
//import { ModalModule } from 'ngx-bootstrap/modal';

import { HomeComponent } from './home.component';
import { ModalModule } from 'ngx-bootstrap/modal';
import { ToastrModule } from 'ngx-toastr';

const routes: Routes = [
    { path: '', component: HomeComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [HomeComponent],
    imports: [
        CommonModule,
        FormsModule,
        CarouselModule,
        ModalModule.forRoot(),
        ToastrModule.forRoot(),
        RouterModule.forChild(routes)
    ]
})

export class HomeModule { }
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CarouselModule } from 'ngx-bootstrap/carousel';
import { ModalModule } from 'ngx-bootstrap/modal';
import { AlertModule } from 'ngx-bootstrap/alert';
import { ToastrModule } from 'ngx-toastr';

import { IntroductionComponent } from './introduction.component';
import { NgxGalleryModule } from 'ngx-gallery';

const routes: Routes = [
    { path: '', component: IntroductionComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [IntroductionComponent],
    imports: [
        CommonModule,
        FormsModule,
        NgxGalleryModule,
        CarouselModule.forRoot(),
        ModalModule.forRoot(),
        AlertModule.forRoot(),
        ToastrModule.forRoot(),
        RouterModule.forChild(routes)
    ]
})
export class IntroductionModule { }
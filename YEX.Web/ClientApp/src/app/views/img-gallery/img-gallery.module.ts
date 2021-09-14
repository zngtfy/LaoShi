import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CarouselModule } from 'ngx-bootstrap/carousel';
import { NgxGalleryModule } from 'ngx-gallery';

import { ImgGalleryComponent } from './img-gallery.component';

const routes: Routes = [
    { path: '', component: ImgGalleryComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [ImgGalleryComponent],
    imports: [
        CommonModule,
        FormsModule,
        CarouselModule,
        NgxGalleryModule,
        RouterModule.forChild(routes)
    ]
})

export class ImgGalleryModule { }
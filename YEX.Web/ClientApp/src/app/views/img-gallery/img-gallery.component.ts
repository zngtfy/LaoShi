import { Component, OnInit } from '@angular/core';
import { HomeProvider } from '../../providers';
import { Utils } from '../../utilities';
import { NgxGalleryOptions, NgxGalleryImage, NgxGalleryAnimation } from 'ngx-gallery';
import 'hammerjs';

@Component({
    selector: 'app-img-gallery',
    templateUrl: './img-gallery.component.html',
    styleUrls: ['./img-gallery.component.css']
})
export class ImgGalleryComponent implements OnInit {
    galleryOptions: NgxGalleryOptions[];
    galleryImages: NgxGalleryImage[];
    message: any = '';
    constructor(
        private proHome: HomeProvider,
    ) { }

    ngOnInit() {
        this.galleryOptions = [
            {
                width: '100%',
                height: '600px',
                thumbnailsColumns: 4,
                imageAnimation: NgxGalleryAnimation.Slide,
                imageDescription: true
            },
            // max-width 800
            {
                breakpoint: 800,
                width: '100%',
                height: '600px',
                imagePercent: 80,
                thumbnailsPercent: 20,
                thumbnailsMargin: 20,
                thumbnailMargin: 20
            },
            // max-width 400
            {
                breakpoint: 400,
                preview: false
            }
        ];
        this.loadImageGallery();

        // this.galleryImages = [
        //     {
        //         small: 'assets/img/gallery/img_1.jpg',
        //         medium: 'assets/img/gallery/img_1.jpg',
        //         big: 'assets/img/gallery/img_1.jpg',
        //         description :"d ada sdasd as da"
        //     },
        //     {
        //         small: 'assets/img/gallery/img_7.jpg',
        //         medium: 'assets/img/gallery/img_7.jpg',
        //         big: 'assets/img/gallery/img_7.jpg',
        //         description :"d ada sdasd as da"
        //     },
        //     {
        //         small: 'assets/img/gallery/img_9.jpg',
        //         medium: 'assets/img/gallery/img_9.jpg',
        //         big: 'assets/img/gallery/img_9.jpg',
        //         description :"d ada sdasd as da"
        //     },
        //     {
        //         small: 'assets/img/gallery/img_23.jpg',
        //         medium: 'assets/img/gallery/img_23.jpg',
        //         big: 'assets/img/gallery/img_23.jpg',
        //         description :"d ada sdasd as da"
        //     },
        //     {
        //         small: 'assets/img/gallery/img_48.jpg',
        //         medium: 'assets/img/gallery/img_48.jpg',
        //         big: 'assets/img/gallery/img_48.jpg'
        //     },
        //     {
        //         small: 'assets/img/gallery/img_25.jpg',
        //         medium: 'assets/img/gallery/img_25.jpg',
        //         big: 'assets/img/gallery/img_25.jpg'
        //     },
        //     {
        //         small: 'assets/img/gallery/img_40.jpg',
        //         medium: 'assets/img/gallery/img_40.jpg',
        //         big: 'assets/img/gallery/img_40.jpg'
        //     },
        //     {
        //         small: 'assets/img/gallery/img_42.jpg',
        //         medium: 'assets/img/gallery/img_42.jpg',
        //         big: 'assets/img/gallery/img_42.jpg'
        //     },
        //     {
        //         small: 'assets/img/gallery/img_55.jpg',
        //         medium: 'assets/img/gallery/img_55.jpg',
        //         big: 'assets/img/gallery/img_55.jpg'
        //     },
        //     {
        //         small: 'assets/img/gallery/img_89.jpg',
        //         medium: 'assets/img/gallery/img_89.jpg',
        //         big: 'assets/img/gallery/img_89.jpg'
        //     },
        //     {
        //         small: 'assets/img/gallery/img_151.jpg',
        //         medium: 'assets/img/gallery/img_151.jpg',
        //         big: 'assets/img/gallery/img_151.jpg'
        //     },
        //     {
        //         small: 'assets/img/gallery/img_99.jpg',
        //         medium: 'assets/img/gallery/img_99.jpg',
        //         big: 'assets/img/gallery/img_99.jpg'
        //     }
        // ];
    }

    public loadImageGallery()
    {
        Utils.showSpinner(true);
        let x = {
            page: 0,
            size: 10
        };

        //console.log(x);

        this.proHome.loadImageGallery(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.galleryImages = rsp.data;
                console.log(rsp.data);
            } else {
                this.message = rsp.message;
            }
            Utils.showSpinner(false);
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

}

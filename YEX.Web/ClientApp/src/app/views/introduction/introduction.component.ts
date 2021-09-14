import { Component, ViewChild, OnInit } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { Utils, Token } from '../../utilities';
import { UserProvider } from '../../providers';
import { HomeProvider } from '../../providers';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';
import { NgxGalleryOptions, NgxGalleryImage, NgxGalleryAnimation } from 'ngx-gallery';

@Component({
    selector: 'app-introduction',
    templateUrl: './introduction.component.html',
    styleUrls: ['./introduction.component.css']
})
export class IntroductionComponent implements OnInit {
    galleryOptions: NgxGalleryOptions[];
    introImages: NgxGalleryImage[];

    message: string = '';
    curUser: any = {
        Id: 0,
        UserName: "admin",
        FirstName: "Hao",
        LastName: "Lee",
        FullName: "Người dùng",
        Language: "vi-vn",
        Role: "",
        Avatar: "assets/img/avatars/ava1.png"
    };
    TeacherInfo: any = {
        id: 0,
        userId: 0,
        birthday: "1900-01-01T00:00:00",
        fullName: "No Name",
        address: "No address",
        phoneNumber: "+XX XXX XXX XX",
        introduction: null,
        schoolId: 1,
        email: "xxx@gmail.com",
        userName: "xxxx",
        avatar: "assets/img/avatars/ava1.png",
        schoolCode: "HCMOU",
        schoolName: "Trường Đại học Mở TP.HCM",
        logoUrl: "assets/img/logo/logo-ou.png",
        schoolType: "Public School",
        schoolAddress: "35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.",
        schoolPhone: "+8428-38364748",
        webSite: "http://ou.edu.vn/",
        schoolDescription: ""
    };
    TeacherEduAll: any = {
        graduate: null,
        postGraduate: null,
        doctoral: null
    };
    TeacherWorkAll: any = {
        working: null,
        teaching: null
    };
    TeacherMajor: any = null;
    @ViewChild('eduModal', { static: false }) public eduModal: ModalDirective;
    @ViewChild('workModal', { static: false }) public workModal: ModalDirective;
    @ViewChild('majorModal', { static: false }) public majorModal: ModalDirective;
    @ViewChild('infoModal', { static: false }) public infoModal: ModalDirective;
    constructor(
        private proUser: UserProvider,
        private proHome: HomeProvider,
        private toastr: ToastrService
    ) { }

    ngOnInit() {
        this.getCurUser();

        this.galleryOptions = [
            {
                width: '100%',
                height: '300px',
                thumbnails: false,
                imageAnimation: NgxGalleryAnimation.Slide,
                imageDescription: true
            }
        ];
        this.loadImageIntro();
    }

    getCurUser() {
        let t = Token.getUser();
        //console.log(t);
        if (t == null) {
            this.curUser = {
                id: 0,
                userName: "no-one",
                firstName: "Người",
                lastName: "dùng",
                fullName: "Người dùng",
                language: "vi-vn",
                role: "",
                avatar: "assets/img/avatars/ava1.png"
            }
        }
        else {
            this.curUser = t;
        }
    }

    openInfoModal() {
        this.infoModal.show();
        if (this.curUser.id > 0) {
            Utils.showSpinner(true);
            let x = {
                id: 1,
                type: "",
                page: 0,
                size: 0
            };

            this.proHome.getTeacherInfo(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.TeacherInfo = rsp.data;
                    //console.log(rsp.data);
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

    openEduModal() {
        this.eduModal.show();
        if (this.curUser.id > 0) {
            Utils.showSpinner(true);
            let x = {
                id: 1,
                type: "",
                page: 1,
                size: 10
            };

            this.proHome.getTeacherEduAll(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.TeacherEduAll = rsp.data;
                    //console.log(rsp.data);
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

    openWorkModal() {
        this.workModal.show();
        if (this.curUser.id > 0) {
            Utils.showSpinner(true);
            let x = {
                id: 1,
                type: "",
                page: 1,
                size: 20
            };

            this.proHome.getTeacherExpAll(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.TeacherWorkAll = rsp.data;
                    //console.log(rsp.data);
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

    openMajorModal() {
        this.majorModal.show();
        if (this.curUser.id > 0) {
            Utils.showSpinner(true);
            let x = {
                id: 1,
                type: "",
                page: 1,
                size: 20
            };

            this.proHome.getTeacherMajor(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.TeacherMajor = rsp.data;
                    //console.log(rsp.data);
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

    formatDate(str) {
        return moment(str).format('D MMMM YYYY');
    }

    public loadImageIntro() {
        Utils.showSpinner(true);
        let x = {
            page: 0,
            size: 10
        };

        this.proHome.loadImageIntro(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                this.introImages = rsp.data;
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

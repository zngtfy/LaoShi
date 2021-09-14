import { Component, OnInit } from '@angular/core';
import { Utils, Token } from '../../utilities';
import { TeacherProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';


@Component({
    selector: 'app-dashboard-teacher',
    templateUrl: './dashboard-teacher.component.html',
    styleUrls: ['./dashboard-teacher.component.css']
})
export class DashboardTeacherComponent implements OnInit {
    curUser: any = {
        id: 0,
        userName: "admin",
        firstName: "Hao",
        lastName: "Lee",
        fullName: "Người dùng",
        language: "vi-vn",
        role: "",
        avatar: "assets/img/avatars/ava1.png"
    };
    statistic: any = {
        classes: {
            data: [],
            totalRecords: 0,
            page: 0,
            size: 5,
            totalPages: 0,
        },
        thesises: {
            data: [],
            totalRecords: 0,
            page: 0,
            size: 5,
            totalPages: 0,
        }
    };
    message: any = '';
    size: number = 2;
    constructor(
        private router: Router,
        private proTeacher: TeacherProvider,
        private toastr: ToastrService,
    ) { }

    ngOnInit(): void {
        this.getCurUser();
    }

    getCurUser() {
        let t = Token.getUser();
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
            this.getDashboardForTeacher();
        }
    }

    getDashboardForTeacher() {
        Utils.showSpinner(true);

        let x = {
            userId: this.curUser.id,
            size: this.size,
            page: 1
        };

        this.proTeacher.getDashboardForTeacher(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                this.statistic = rsp.data;
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToastError(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    getClassForTeacher(cPage) {
        Utils.showSpinner(true);

        let x = {
            userId: this.curUser.id,
            size: this.size,
            page: cPage
        };

        this.proTeacher.getClassForTeacher(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                this.statistic.classes = rsp.data;
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToastError(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    getThesisForTeacher(cPage) {
        Utils.showSpinner(true);

        let x = {
            userId: this.curUser.id,
            size: this.size,
            page: cPage
        };

        this.proTeacher.getThesisForTeacher(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                this.statistic.thesises = rsp.data;
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToastError(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    pageChangedClass(event: any): void {
        //console.log('Page changed to: ' + event.page);
        //console.log('Number items per page: ' + event.itemsPerPage);
        this.getClassForTeacher(event.page);
    }

    pageChangedThesis(event: any): void {
        //console.log('Page changed to: ' + event.page);
        //console.log('Number items per page: ' + event.itemsPerPage);
        this.getThesisForTeacher(event.page);
    }

    showToastSuccess(info) {
        this.toastr.success(info, 'Thông báo !', {
            timeOut: 4000,
            positionClass: 'toast-top-center',
            closeButton: true,
            progressBar: true,
        });
    }

    showToastError(info) {
        this.toastr.warning(info, 'Thông báo !', {
            timeOut: 3000,
            positionClass: 'toast-top-center',
            closeButton: true,
            progressBar: true,
        });
    }

    formatDate(str) {
        return moment(str).format('DD/MM/YYYY');
    }

    getSTT(i, type) {
        var page = 1;
        if(type=="thesis")
            page = this.statistic.thesises.page;
        else
            page = this.statistic.classes.page;
        var stt = (page - 1) * this.size;
        stt = stt + i + 1;
        return stt;
    }
}

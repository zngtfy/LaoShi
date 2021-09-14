import { Component, OnInit } from '@angular/core';
import { UserProvider } from '../../providers';
import { Utils } from '../../utilities';
import { HomeProvider } from '../../providers';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    selector: 'app-study',
    templateUrl: './study.component.html',
    styleUrls: ['./study.component.css']
})
export class StudyComponent implements OnInit {
    size: number = 5;
    message: any = '';
    TeacherPublicProfile: any = [];
    TeacherStudy: any = {};
    constructor(
        private proHome: HomeProvider,
        private toastr: ToastrService
    ) { }

    ngOnInit() {
        this.getTeacherStudy(() => this.getTeacherPublicProfile());
    }

    getTeacherPublicProfile() {
        Utils.showSpinner(true);
        let x = {
            id: 1,
            type: "",
            page: 1,
            size: 6
        };

        this.proHome.getTeacherPublicProfile(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.TeacherPublicProfile = rsp.data.data;
            } else {
                this.message = rsp.message;
            }
            Utils.showSpinner(false);
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    getTeacherStudy(success) {
        Utils.showSpinner(true);
        let x = {
            id: 1,
            type: "",
            page: 1,
            size: this.size
        };

        this.proHome.getTeacherStudy(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.TeacherStudy = rsp.data;
                success();
            } else {
                this.message = rsp.message;
            }
            Utils.showSpinner(false);
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    loadNextStudy() {
        let curPage = this.TeacherStudy.page;
        let nextPage = curPage + 1;
        let totPage = this.TeacherStudy.totalPages;
        if (curPage >= totPage) {
            this.toastr.error('Không còn dữ liệu', 'Bạn đang ở trang cuối cùng, không thể tìm kiếm nữa!', {
                timeOut: 3000,
                closeButton: true,
                progressBar: true
            });
        }
        else {
            Utils.showSpinner(true);
            let x = {
                id: 1,
                type: "",
                page: nextPage,
                size: this.size
            };

            this.proHome.getTeacherStudy(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.TeacherStudy = rsp.data;
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

    loadPrevStudy() {
        let curPage = this.TeacherStudy.page;
        let prevPage = curPage - 1;
        if (curPage <= 1) {
            this.toastr.error('Không còn dữ liệu', 'Bạn đang ở trang đầu tiên, không thể tìm kiếm nữa!', {
                timeOut: 3000,
                closeButton: true,
                progressBar: true
            });
        }
        else {
            Utils.showSpinner(true);
            let x = {
                id: 1,
                type: "",
                page: prevPage,
                size: this.size
            };

            this.proHome.getTeacherStudy(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.TeacherStudy = rsp.data;
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
}

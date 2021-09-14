import { Component, OnInit, ViewChild } from '@angular/core';
import { HomeProvider, FileProvider } from '../../providers';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { Utils } from '../../utilities';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    selector: 'app-dedicate-student',
    templateUrl: './dedicate-student.component.html',
    styleUrls: ['./dedicate-student.component.css']
})
export class DedicateStudentComponent implements OnInit {
    @ViewChild('studentModal', { static: false }) public studentModal: ModalDirective;
    keyword: string = '';
    size: number = 5;
    message: any = '';
    TeacherDedicateStudent: any = {
        data: [],
        totalRecords: 0,
        page: 0,
        size: 5,
        totalPages: 0,
    };

    public pageSize = 5;
    public pager: any = {};
    public pagedItems: any[];
    public total: number = 0;
    public data = [];
    public setting = {};

    public modalData;

    constructor(
        private proHome: HomeProvider,
        private proFile: FileProvider,
        private toastr: ToastrService
    ) { }

    ngOnInit() {

    }

    public searchDedicateStudent() {
        Utils.showSpinner(true);
        let x = {
            id: 1,
            type: "",
            keyword: this.keyword,
            page: 1,
            size: this.size
        };

        //console.log(x);

        this.proHome.getTeacherDelegateStudent(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.TeacherDedicateStudent = rsp.data;
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

    loadNextStudent() {
        let curPage = this.TeacherDedicateStudent.page;
        let nextPage = curPage + 1;
        let totPage = this.TeacherDedicateStudent.totalPages;
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

            this.proHome.getTeacherDelegateStudent(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.TeacherDedicateStudent = rsp.data;
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

    loadPrevStudent() {
        let curPage = this.TeacherDedicateStudent.page;
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

            this.proHome.getTeacherDelegateStudent(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.TeacherDedicateStudent = rsp.data;
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

    viewStudent(studentId) {
        this.modalData = this.TeacherDedicateStudent.data.filter(d => d.studentId == studentId)[0];
        this.studentModal.show();
    }

    formatDate(str) {
        return moment(str).format('D MMMM YYYY');
    }

}

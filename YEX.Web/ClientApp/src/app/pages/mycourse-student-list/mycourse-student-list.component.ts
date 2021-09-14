import { Component, OnInit, ViewChild } from '@angular/core';
import { Utils, Token } from '../../utilities';
import { StudentProvider } from '../../providers';
import { Router } from '@angular/router';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    selector: 'app-mycourse-student-list',
    templateUrl: './mycourse-student-list.component.html',
    styleUrls: ['./mycourse-student-list.component.css']
})
export class MycourseStudentListComponent implements OnInit {
    @ViewChild('studentInfoModal', { static: false }) public studentInfoModal: ModalDirective;
    size: number = 5;
    message: string = "";
    curClass: any = {
        ClassId: 0,
        ClassCode: "",
        ClassName: "",
        SubjectId: 0,
        Venue: "",
        Description: "",
        Images: "",
        Semester: 0,
        SchoolYear: "",
        TotalSession: 20,
        Note: "",
        Status: 0,
        TeacherId: 0,
        CreatedOn: "",
        SubjectCode: "",
        SubjectName: "",
        SubjectType: "",
        TotalCredit: 0,
        TheoryCredit: 0,
        PracticeCredit: 0,
        SchoolId: 0,
        TeacherFullname: "",
        TeacherPhone: "",
        TeacherIntro: null,
        SchoolCode: "",
        SchoolName: "",
        LogoUrl: "",
    };
    studentList:any ={
        data: [],
        totalRecords: 0,
        page: 0,
        size: 5,
        totalPages: 0,
    };
    studentDetail:any={};
    constructor(
        private router: Router,
        private proStudent: StudentProvider,
        private toastr: ToastrService,
    ) { }

    ngOnInit() {
        this.getCurClass();
    }

    getCurClass() {
        let t = Token.getCurCls();
        //console.log(t);
        if (t == null) {
            this.curClass = {
                ClassId: 0,
                ClassCode: "",
                ClassName: "",
                SubjectId: 0,
                Venue: "",
                Description: "",
                Images: "",
                Semester: 0,
                SchoolYear: "",
                TotalSession: 20,
                Note: "",
                Status: 0,
                TeacherId: 0,
                CreatedOn: "",
                SubjectCode: "",
                SubjectName: "",
                SubjectType: "",
                TotalCredit: 0,
                TheoryCredit: 0,
                PracticeCredit: 0,
                SchoolId: 0,
                TeacherFullname: "",
                TeacherPhone: "",
                TeacherIntro: null,
                SchoolCode: "",
                SchoolName: "",
                LogoUrl: "",
            }
        }
        else {
            this.curClass = t;
            this.loadStudentList();
        }
        if (this.curClass.ClassId == 0) {
            this.router.navigate(['/transfer']);
        }
    }

    loadStudentList()
    {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.ClassId,
            Page: 1,
            Size: this.size
        };

        this.proStudent.loadCourseStudent(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.studentList = rsp.data;
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToast(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    loadPrevStudentList()
    {
        let curPage = this.studentList.page;
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
                classId: this.curClass.ClassId,
                page: prevPage,
                size: this.size
            };

            this.proStudent.loadCourseStudent(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.studentList = rsp.data;
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

    loadNextStudentList()
    {
        let curPage = this.studentList.page;
        let nextPage = curPage + 1;
        let totPage = this.studentList.totalPages;
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
                classId: this.curClass.ClassId,
                page: nextPage,
                size: this.size
            };

            this.proStudent.loadCourseStudent(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.studentList = rsp.data;
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

    showDetail(stuId)
    {
        Utils.showSpinner(true);

        let x = {
            classId: stuId,
            Page: 0,
            Size: 0
        };

        this.proStudent.getStudentInfo(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.studentDetail = rsp.data;
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToast(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
        this.studentInfoModal.show();
    }

    showToast(info) {
        this.toastr.error(info, 'Thông báo !', {
            timeOut: 3000,
            closeButton: true,
            progressBar: true,
        });
    }

    getSTT(i)
    {
        var page = this.studentList.page;
        var stt = (page - 1) * this.size;
        stt = stt + i + 1;
        return stt;
    }

    formatDate(str) {
        return moment(str).format('D MMMM YYYY HH:mm');
    }
    formatDate1(str) {
        return moment(str).format('DD-MM-YYYY HH:mm');
    }
    formatDate2(str) {
        return moment(str).format('DD/MM/YYYY');
    }
}

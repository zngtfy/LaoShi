import { Component, OnInit } from '@angular/core';
import { Utils, Token } from '../../utilities';
import { StudentProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    templateUrl: 'dashboard.component.html',
    styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
    size: number = 5;
    message: string = "";
    announcements: any = {
        data: [],
        totalRecords: 0,
        page: 0,
        size: 5,
        totalPages: 0,
    };
    firstAnnouncement: any = {};
    statistic: any = {
        totalStudent: 14,
        totalTeacher: 3,
        totalSession: 20,
        beginDate: "2020-02-07T00:00:00",
        endDate: "2020-05-01T00:00:00",
        classStatus: "Đang học !",
        theoryStatus: "0 / 10",
        practiseStatus: "0 / 10",
        subjectCode: "ITEC2501",
    };
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

    constructor(
        private router: Router,
        private proStudent: StudentProvider,
        private toastr: ToastrService,
    ) { }


    ngOnInit(): void {
        //let domain = document.location.origin;
        //console.log(domain);
        this.getCurClass();
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
        }
    }

    getCurClass() {
        let t = Token.getCurCls();
        //let role = Token.getUser();
        //let right = Token.righ
        //console.log(role);
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
            this.getDashboardForStudent();
        }
        if (this.curClass.ClassId == 0) {
            this.router.navigate(['/transfer']);
        }
    }

    getDashboardForStudent() {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.ClassId,
            Page: 1,
            Size: this.size
        };

        this.proStudent.getDashboardForStudent(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.statistic = rsp.data.statistic;
                this.announcements = rsp.data.announcements;
                if (rsp.data.announcements.data.length > 0) {
                    this.firstAnnouncement = rsp.data.announcements.data[0];
                }
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

    loadNextAnnouncement() {
        let curPage = this.announcements.page;
        let nextPage = curPage + 1;
        let totPage = this.announcements.totalPages;
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

            this.proStudent.loadMoreAnnouncement(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.announcements = rsp.data;
                    if (rsp.data.data.length > 0) {
                        this.firstAnnouncement = rsp.data.data[0];
                    }
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

    loadPrevAnnouncement() {
        let curPage = this.announcements.page;
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

            this.proStudent.loadMoreAnnouncement(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.announcements = rsp.data;
                    if (rsp.data.data.length > 0) {
                        this.firstAnnouncement = rsp.data.data[0];
                    }
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

    loadDetail(index) {
        //console.log(index);
        this.firstAnnouncement = this.announcements.data[index];
    }

    showToast(info) {
        this.toastr.error(info, 'Thông báo !', {
            timeOut: 3000,
            closeButton: true,
            progressBar: true,
        });
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

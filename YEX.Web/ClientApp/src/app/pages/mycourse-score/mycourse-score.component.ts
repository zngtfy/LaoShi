import { Component, OnInit } from '@angular/core';
import { Utils, Token } from '../../utilities';
import { StudentProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    selector: 'app-mycourse-score',
    templateUrl: './mycourse-score.component.html',
    styleUrls: ['./mycourse-score.component.css']
})
export class MycourseScoreComponent implements OnInit {
    message: string = "";
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
    courseScores: any = [];
    student: any = {
        id: 12,
        userId: 17,
        birthday: "2000-06-27T00:00:00",
        gender: false,
        officialStudentId: "1851010037",
        schoolId: 1,
        courseName: "Khoa học máy tính, khóa 2018-2020",
        className: "DH19IM01",
        note: "Sinh viên khóa 2016, ngành HTTTQL",
        status: 1,
        createdBy: 1,
        createdOn: "2019-12-01T00:00:00",
        firstName: "Hào",
        lastName: "Quách Phú",
        email: "lochh.188i@ou.edu.vn",
        address: " 35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.",
        phone: "+84 987654321",
        userName: "s17",
        avatar: "assets/img/avatars/5.jpg",
        schoolCode: "HCMOU",
        schoolName: "Trường Đại học Mở TP.HCM",
        logoUrl: "assets/img/logo/logo-ou.png",
        schoolType: "Public School",
        schoolAddress: "35 – 37 Hồ Hảo Hớn, Phường Cô Giang, Quận 1, TP. HCM.",
        schoolPhone: "+8428-38364748",
        webSite: "http://ou.edu.vn/"
    };
    result: any = {
        totPer: 0,
        avgScore: 0.0,
        isFull: false
    };
    isCollapsed: boolean = false;
    constructor(
        private router: Router,
        private proStudent: StudentProvider,
        private toastr: ToastrService
    ) { }

    ngOnInit() {
        this.getCurUser();
        this.getCurClass();
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
            this.loadCourseScore();
        }
        if (this.curClass.ClassId == 0) {
            this.router.navigate(['/transfer']);
        }
    }

    loadCourseScore() {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.ClassId,
            userId: this.curUser.id
        };

        this.proStudent.loadCourseScore(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.courseScores = rsp.data.list;
                this.student = rsp.data.student;
                var n = 0;
                var tempScoreTotal = 0;
                for (var i = 0; i < rsp.data.list.length; i++) {
                    var item = rsp.data.list[i];
                    this.result.totPer = this.result.totPer + item.percentage;

                    if (item.score != null) {
                        tempScoreTotal += item.score * item.percentage;
                        n++;
                    }
                }
                if (n == rsp.data.list.length) {
                    this.result.avgScore = tempScoreTotal / this.result.totPer;
                    this.result.isFull = true;
                }
                else
                    this.result.isFull = false;
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

    collapsed(event: any): void {
        // console.log(event);
    }

    expanded(event: any): void {
        // console.log(event);
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
}

import { Component, OnInit } from '@angular/core';
import { Utils, Token } from '../../utilities';
import { StudentProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    selector: 'app-mycourse-teacher',
    templateUrl: './mycourse-teacher.component.html',
    styleUrls: ['./mycourse-teacher.component.css']
})
export class MycourseTeacherComponent implements OnInit {
    message:any="";
    teacherInfo:any={
        teacher:null,
        skills:[],
        languages:[],
        experiences:[],
        education:[]
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
    constructor(
        private router: Router,
        private toastr: ToastrService,
        private proStudent: StudentProvider
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
            this.getTeacherInfo();
        }
        if (this.curClass.ClassId == 0) {
            this.router.navigate(['/transfer']);
        }
    }

    getTeacherInfo() {
        Utils.showSpinner(true);
        let x = {
            id: this.curClass.TeacherId,
        };

        this.proStudent.getTeacherInfo(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.teacherInfo = rsp.data;
            } else {
                this.message = rsp.message;
            }
            Utils.showSpinner(false);
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
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
        return moment(str).format('D MMMM YYYY HH:mm');
    }
    formatDate1(str) {
        return moment(str).format('DD-MM-YYYY HH:mm');
    }
    formatDate2(str) {
        return moment(str).format('DD/MM/YYYY');
    }
}

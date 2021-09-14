import { Component, OnInit } from '@angular/core';
import { Utils, Token } from '../../utilities';
import { StudentProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    selector: 'app-mycourse-intro',
    templateUrl: './mycourse-intro.component.html',
    styleUrls: ['./mycourse-intro.component.css']
})
export class MycourseIntroComponent implements OnInit {
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
    courseInfo: any = {
        class: null,
        subject: null,
        school: null,
        teacher: null,
        classMembers: [],
        sessionLts: [],
        sessionThs: [],
        sessionBoth: []
    };
    totalClassUnit_LT = 0;
    totalClassUnit_TH = 0;
    totalClassUnit_Both = 0;
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
            this.loadCourseInfo();
        }
        if (this.curClass.ClassId == 0) {
            this.router.navigate(['/transfer']);
        }
    }

    loadCourseInfo() {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.ClassId,
            Page: 0,
            Size: 0
        };

        this.proStudent.loadCourseInfo(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.courseInfo = rsp.data;
                this.getTotalSes();
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

    getTimeofDay(date, time) {
        date = moment(date).format('YYYY-MM-DD');
        let t = moment(date + "T" + time + ":00");
        //return t;
        return this.getGreetingTime(t);
    }

    getTotalSes() {
        for (var i = 0; i < this.courseInfo.sessionLts.length; i++) {
            var totalClassUnit = this.courseInfo.sessionLts[i].totalClassUnit;
            this.totalClassUnit_LT = this.totalClassUnit_LT + totalClassUnit;
        }
        for (var i = 0; i < this.courseInfo.sessionThs.length; i++) {
            var totalClassUnit = this.courseInfo.sessionThs[i].totalClassUnit;
            this.totalClassUnit_TH = this.totalClassUnit_TH + totalClassUnit;
        }
        for (var i = 0; i < this.courseInfo.sessionBoth.length; i++) {
            var totalClassUnit = this.courseInfo.sessionBoth[i].totalClassUnit;
            this.totalClassUnit_Both = this.totalClassUnit_Both + totalClassUnit;
        }
    }

    getGreetingTime = (currentTime) => {
        if (!currentTime || !currentTime.isValid()) { return 'None'; }

        const splitAfternoon = 12; // 24hr time to split the afternoon
        const splitEvening = 18; // 24hr time to split the evening
        const currentHour = parseFloat(currentTime.format('HH'));

        if (currentHour >= splitAfternoon && currentHour <= splitEvening) {
            // Between 12 PM and 5PM
            return 'Buổi chiều';
        } else if (currentHour >= splitEvening) {
            // Between 5PM and Midnight
            return 'Buổi tối';
        }
        // Between dawn and noon
        return 'Buổi sáng';
    }
}

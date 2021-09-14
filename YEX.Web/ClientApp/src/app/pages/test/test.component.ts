import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { Router, ActivatedRoute, ParamMap } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { Utils, Token } from '../../utilities';
import { StudentProvider } from '../../providers';
import * as moment from 'moment';
import { switchMap } from 'rxjs/operators';
import { timer } from 'rxjs';

@Component({
    selector: 'app-test',
    templateUrl: './test.component.html',
    styleUrls: ['./test.component.css'],
    encapsulation: ViewEncapsulation.None
})
export class TestComponent implements OnInit {
    //pagination
    totalItems: number = 64;
    currentPage: number = 1;
    smallnumPages: number = 0;
    curQuestion: any = null;
    //
    message: string = "";
    size: number = 5;
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
    assignmentId: any = "0";
    totTime: number = 10;
    timeLeft: number = 10;
    passTime: number = 0;
    duration: any = "00:00:00";
    countDown: any = "00:00:00";
    startTime: any;
    endTime: any;
    interval;
    myStyles = {
        width: '0%'
    }
    assigmentExam: any = {
        assignmentExam: null,
        exam: null,
        studentExam: null
    };
    resultExam:any = {
        studentExam:null,
        studentExamDetails:null,
        studentScore:null
    }
    questions: any = [];
    answers: any = [];
    constructor(
        private route: ActivatedRoute,
        private toastr: ToastrService,
        private router: Router,
        private proStudent: StudentProvider
    ) { }

    ngOnInit() {
        this.assignmentId = this.route.snapshot.paramMap.get('id');
        //console.log(this.assignmentId);
        if (this.assignmentId == null)
            this.router.navigate(['/page-not-found']);

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
            this.getClassAssignmentExam();
        }
        if (this.curClass.ClassId == 0) {
            this.router.navigate(['/transfer']);
        }
    }

    getClassAssignmentExam() {
        Utils.showSpinner(true);

        let x = {
            classAssignmentId: parseInt(this.assignmentId),
            userId: this.curUser.id,
            page: 0,
            size: 0
        };

        this.proStudent.getClassAssignmentExam(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.assigmentExam = rsp.data;
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

    startTimer() {
        Utils.showSpinner(true);

        let x = {
            examId: this.assigmentExam.exam.id,
            userId: this.curUser.id,
            page: 0,
            size: 0
        };

        this.proStudent.getQuestionAndAnserForStudent(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.questions = rsp.data.questions;
                this.timeLeft = rsp.data.exam.totMinutes * 60;
                this.totTime = rsp.data.exam.totMinutes * 60;
                this.totalItems = rsp.data.questions.length;
                this.currentPage = 1;
                this.curQuestion = this.questions[0];
                //let answers = [];
                for (var i = 0; i < this.questions.length; i++) {
                    let a: any = {};
                    a.questionId = this.questions[i].questionId;
                    a.questionType = this.questions[i].questionType;
                    a.totMinutes = this.questions[i].totMinutes;
                    a.totScore = this.questions[i].totScore;
                    a.answerIds = [];
                    this.answers.push(a);
                }
                //console.log(this.answers);
                this.startTime = new Date();
                this.startTimeNext();
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

    startTimeNext() {
        this.interval = setInterval(() => {
            if (this.timeLeft > 0) {
                this.timeLeft--;
                this.convert(this.timeLeft);
                this.styleChange();
            } else {
                clearInterval(this.interval);
                this.showToastError("Bạn đã hết thời gian làm bài !!!");
            }
        }, 1000);
    }

    styleChange() {
        let passTime = this.totTime - this.timeLeft;
        this.passTime = this.totTime - this.timeLeft;
        let per = (passTime / this.totTime) * 100;
        let style = {
            width: per + '%'
        }
        this.myStyles = style;
    }

    pauseTimer() {
        clearInterval(this.interval);
        this.timeLeft = 0;
        this.endTime = new Date();
        this.duration = this.convert1(this.passTime);
        //console.log(this.startTime);
        //console.log(this.endTime);
        this.studentAnswer();
    }

    studentAnswer() {
        Utils.showSpinner(true);
        let x = {
            classAssignmentId: parseInt(this.assignmentId),
            examId: this.assigmentExam.exam.id,
            userId: this.curUser.id,
            startTime: this.startTime,
            endTime: this.endTime,
            listAns: this.answers
        };

        this.proStudent.studentAnswer(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.resultExam = rsp.data;
            } else {
                this.message = rsp.message;
                this.showToastError(rsp.message);
            }
            Utils.showSpinner(false);
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    convert(s) {
        let duration = moment.duration(s, 'seconds');
        this.countDown = moment.utc(duration.asMilliseconds()).format('HH:mm:ss');
    }

    convert1(s) {
        let duration = moment.duration(s, 'seconds');
        return moment.utc(duration.asMilliseconds()).format('HH:mm:ss');
    }

    showToastError(info) {
        this.toastr.warning(info, 'Thông báo !', {
            timeOut: 3000,
            positionClass: 'toast-top-center',
            closeButton: true,
            progressBar: true,
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

    pageChanged(event: any): void {
        //console.log('Page changed to: ' + event.page);
        //console.log('Number items per page: ' + event.itemsPerPage);
        var index = event.page - 1;
        this.curQuestion = this.questions[index];
        //console.log(this.curQuestion);
    }

    handleChange(evt) {
        var target = evt.target;
        //console.log(target.type);
        //console.log(target.id);
        //console.log(target.checked);
        var index = this.currentPage - 1;
        let qid = this.questions[index].questionId;
        this.answers[index].questionId = qid;
        var arr = target.id.split("_");
        let aid = parseInt(arr[1]);
        let aInd = parseInt(arr[2]);
        let answer = [];
        if (target.checked) {
            this.questions[index].answers[aInd].checked = true;
        }
        else {
            this.questions[index].answers[aInd].checked = false;
        }
        if (target.type == "radio") {
            answer.push(aid);
            this.answers[index].answerIds = answer;
        }
        else {
            if (target.checked) {
                this.answers[index].answerIds.push(aid);
            }
            else {
                answer = this.answers[index].answerIds;
                let nAnswer = [];
                for (var i = 0; i < answer.length; i++) {
                    if (answer[i] != aid)
                        nAnswer.push(answer[i]);
                }
                this.answers[index].answerIds = nAnswer;
            }
        }
        //console.log(this.answers[index]);
    }

    resultScore(score, totScore)
    {
        var s = (parseFloat(score) * 10) / totScore;
        //console.log(s);
        if(s < 3.5)
            return "Yếu";
        else if(s < 5.0)
            return "Kém";
        else if(s < 6.5)
            return "Trung bình";
        else if(s < 7.0)
            return "Trung bình - Khá";
        else if(s < 8.5)
            return "Khá";
        else 
            return "Giỏi";
    }

    formatDate(str) {
        return moment(str).format('DD/MM/YYYY HH:mm');
    }
    formatDate1(str) {
        return moment(str).format('DD/MM/YYYY HH:mm:ss');
    }
}

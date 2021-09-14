import { Component, OnInit } from '@angular/core';
import { Utils, Token } from '../../utilities';
import { GradStudentProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    selector: 'app-dashboard-grad',
    templateUrl: './dashboard-grad.component.html',
    styleUrls: ['./dashboard-grad.component.css']
})
export class DashboardGradComponent implements OnInit {
    curThesis: any = null;
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
        totalTeacher: 0,
        totalReference: 0,
        totalDocument: 0,
        totalUploadWork: 0,
        periodStatus: null
    };
    message: any = '';
    constructor(
        private router: Router,
        private proStudent: GradStudentProvider,
        private toastr: ToastrService,
    ) { }

    ngOnInit(): void {
        this.getCurUser();
        this.getCurThesis();
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

    getCurThesis() {
        let t = Token.getCurThesis();
        //let role = Token.getUser();
        //let right = Token.righ
        //console.log(role);
        //console.log(t);
        if (t == null) {
            this.curThesis = null;
        }
        else {
            this.curThesis = t;
            this.getDashboardForGradStudent();
        }
        if (this.curThesis == null) {
            this.router.navigate(['/transfer']);
        }
    }

    getDashboardForGradStudent() {
        Utils.showSpinner(true);

        let x = {
            thesisId: this.curThesis.ThesisId,
            userId: this.curUser.id,
            Size: 0
        };

        this.proStudent.getDashboardForGradStudent(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
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
        return moment(str).format('D-MMM-YYYY');
    }

    getDiffDays(str, isStart) {
        if (moment().isAfter(this.curThesis.StartTime)
            && moment().isBefore(this.curThesis.EndTime)) {
            let d = moment().diff(str, 'days');
            if (d < 0)
                d = 0 - d;
            return d;
        }
        else {
            if (isStart)
                return moment(this.curThesis.StartTime).diff(this.curThesis.EndTime, 'days');
            else
                return 0;
        }
    }

}

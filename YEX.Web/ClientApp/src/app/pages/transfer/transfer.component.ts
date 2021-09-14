import { Component, OnInit } from '@angular/core';
import { StudentProvider } from '../../providers';
import { Utils, Token } from '../../utilities';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    selector: 'app-transfer',
    templateUrl: './transfer.component.html',
    styleUrls: ['./transfer.component.css']
})
export class TransferComponent implements OnInit {
    curCls:any =[];
    curThesis:any=[];
    message:string='';
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
        private proStudent: StudentProvider,
        private toastr: ToastrService,
    ) { }

    ngOnInit() {
        this.getCurUser();
    }

    getCurUser() {
        let t = Token.getUser();
        //console.log(t);
        if(t==null)
        {
            this.curUser={
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
        else
        {
            this.curUser = t;
            this.loadCurrentClass(t.id);
        }
    }

    loadCurrentClass(id) {
        Utils.showSpinner(true);
        let x = {
            userId: id,
            status: null
        };

        this.proStudent.loadCurrentClass(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.curCls = rsp.data.allClasses;
                this.curThesis = rsp.data.allThesises;
                //console.log(rsp.data);
            } else {
                this.message = rsp.message;
                this.showToast(rsp.message);
            }
            Utils.showSpinner(false);
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    goToClass(classId)
    {
        Utils.showSpinner(true);

        let x = {
            classId: classId,
            status: null
        };

        this.proStudent.goToClass(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.message = '';
                this.proStudent.saveCurrentClass(rsp.data);
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

    goToThesis(id)
    {
        Utils.showSpinner(true);

        let x = {
            thesisId: id,
            userId: this.curUser.id,
            status: null
        };

        this.proStudent.goToThesis(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.message = '';
                this.proStudent.saveCurrentThesis(rsp.data);
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
        return moment(str).format('DD-MM-YYYY');
    }
}

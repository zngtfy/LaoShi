import { Component, OnInit } from '@angular/core';
import { Utils, Token } from '../../utilities';
import { GradStudentProvider, FileProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { saveAs } from 'file-saver';
import * as moment from 'moment';

@Component({
    selector: 'app-thesis-document',
    templateUrl: './thesis-document.component.html',
    styleUrls: ['./thesis-document.component.css']
})
export class ThesisDocumentComponent implements OnInit {
    curThesis: any = null;
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
    message: any = '';
    documents: any = {
        data: [],
        totalRecords: 0,
        page: 0,
        size: 2,
        totalPages: 0,
    };
    constructor(
        private router: Router,
        private proStudent: GradStudentProvider,
        private toastr: ToastrService,
        private proFile: FileProvider,
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
        console.log(t);
        if (t == null) {
            this.curThesis = null;
        }
        else {
            this.curThesis = t;
            this.getThesisDocument(1);
        }
        if (this.curThesis == null) {
            this.router.navigate(['/transfer']);
        }
    }

    getThesisDocument(cPage) {
        Utils.showSpinner(true);

        let x = {
            thesisId: this.curThesis.ThesisId,
            userId: this.curUser.id,
            page: cPage,
            size: this.size
        };

        this.proStudent.getThesisDocument(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                this.documents = rsp.data;
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

    downloadMaterial(id) {
        let item: any = {};

        var arr1 = this.documents.data.filter(d => d.id == id);
        item = arr1[0];

        var dot = item.url.indexOf(".");
        var ext = item.url.substr(dot, item.url.length);
        //console.log(`Thesis_`+item.thesisId +`_Doc` +`_`+id+ext);
        this.proFile.download(item.url).subscribe(data => saveAs(data, `Thesis_` + item.thesisId + `_Doc` + `_` + id + ext));
    }

    pageChanged(event: any): void {
        console.log('Page changed to: ' + event.page);
        console.log('Number items per page: ' + event.itemsPerPage);
        this.getThesisDocument(event.page);
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

    getSTT(i) {
        var page = this.documents.page;
        var stt = (page - 1) * this.size;
        stt = stt + i + 1;
        return stt;
    }

    formatDate(str) {
        return moment(str).format('D-MMM-YYYY');
    }
}

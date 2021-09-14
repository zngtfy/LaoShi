import { Component, OnInit, ViewChild } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { Utils, Token } from '../../utilities';
import { GradStudentProvider, FileProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { saveAs } from 'file-saver';
import * as moment from 'moment';

@Component({
    selector: 'app-thesis-reference',
    templateUrl: './thesis-reference.component.html',
    styleUrls: ['./thesis-reference.component.css']
})
export class ThesisReferenceComponent implements OnInit {
    @ViewChild('viewModal', { static: false }) public viewModal: ModalDirective;
    @ViewChild('citingModal', { static: false }) public citingModal: ModalDirective;
    keyword:string='';
    sortCode:number=0;
    isDisabled:boolean=false;
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
    refs: any = {
        data: [],
        totalRecords: 0,
        page: 0,
        size: 2,
        totalPages: 0,
    };
    curView:string='';
    selectedRef:any={};
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
        }
        if (this.curThesis == null) {
            this.router.navigate(['/transfer']);
        }
    }

    getThesisReference(cPage)
    {
        Utils.showSpinner(true);
        let x = {
            thesisId: this.curThesis.ThesisId,
            sortCode : this.sortCode,
            keyword: this.keyword,
            page: cPage,
            size: this.size
        };
        this.proStudent.getThesisRef(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                this.refs = rsp.data;
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

    pageChanged(event: any): void {
        console.log('Page changed to: ' + event.page);
        console.log('Number items per page: ' + event.itemsPerPage);
        this.getThesisReference(event.page);
    }

    viewRef(id) {
        var arr1 = this.refs.data.filter(d => d.id == id);
        var item = arr1[0];
        this.curView =item.downloadUrl;
        this.viewModal.show();
    }

    getRefText(index)
    {
        var item = this.refs.data[index];
        console.log(item);
        this.selectedRef = item;
        this.citingModal.show();
    }

    downloadRef(id) {
        var arr1 = this.refs.data.filter(d => d.id == id);
        //console.log('arr1', arr1);
        var item = arr1[0];
        this.proFile.download(item.downloadUrl).subscribe(data => saveAs(data, `publication_`+id+`.pdf`));
    }

    searchRef(page)
    {
        this.isDisabled = true;
        //console.log(this.sortCode);
        //console.log(this.keyword);
        //console.log(this.size);
        this.getThesisReference(page);
    }

    clearSearch()
    {
        this.isDisabled = false;
        this.keyword = "";
        this.sortCode = 0;
    }

    selectSort(e)
    {
        //console.log(e.target.value);
        this.sortCode = parseInt(e.target.value);
    }

    selectSize(e)
    {
        //console.log(e.target.value);
        this.size = parseInt(e.target.value);
    }

    getThesisRef(cPage) {
        Utils.showSpinner(true);

        let x = {
            thesisId: this.curThesis.ThesisId,
            keyword: this.keyword,
            sortCode: this.sortCode,
            page: cPage,
            size: this.size
        };

        this.proStudent.getThesisRef(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                this.refs = rsp.data;
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

    getSTT(i) {
        var page = this.refs.page;
        var stt = (page - 1) * this.size;
        stt = stt + i + 1;
        return stt;
    }

    formatDate(str) {
        return moment(str).format('D-MMM-YYYY');
    }

}

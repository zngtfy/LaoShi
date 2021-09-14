import { Component, OnInit, ViewChild } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap';
import { CodeTypeProvider } from 'src/app/providers/code-type';
import { ToastrService } from 'ngx-toastr';
import { Utils } from 'src/app/utilities';
import { error } from 'protractor';

@Component({
    selector: 'app-type-management',
    templateUrl: './type-management.component.html',
    styleUrls: ['./type-management.component.css']
})
export class TypeManagementComponent implements OnInit {

    @ViewChild('addModal', { static: false }) public addModal: ModalDirective;

    public types = [];
    public code: string;
    public displayAs: string;
    public sequence: string;

    public totalPages = 1;
    public pageSize = 10;
    public currentPage = 1;

    public isEdit = false;

    constructor(
        private pro: CodeTypeProvider,
        private toastr: ToastrService
    ) { }

    ngOnInit() {
        this.search(1);
    }

    search(page: any) {
        Utils.showSpinner(true);
        this.currentPage = page;

        let x = {
            page: page,
            size: this.pageSize
        };

        this.pro.search(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.types = rsp.data.data;
                this.totalPages = rsp.data.totalPages;
            }
            Utils.showSpinner(false);
        });
    }

    openAdd() {
        this.isEdit = false;
        this.addModal.show();
        this.code = null;
        this.displayAs = null;
    }

    validate() {
        let errors = [];

        if (this.code == null || this.code.trim() == '') {
            errors.push('Please enter your code');
        }

        if (this.displayAs == null || this.displayAs.trim() == '') {
            errors.push('Please enter display as');
        }

        return errors;
    }

    add() {
        let errors = this.validate();
        if (errors.length > 0) {
            errors.forEach(err => {
                this.showInformationModal('error', err);
            });
            return;
        }

        this.addModal.hide();
        Utils.showSpinner(true);

        let x = {
            "code": this.code,
            "displayAs": this.displayAs,
            "sequence": this.sequence
        };

        this.pro.add(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.search(1);
                this.showInformationModal('success', 'Create success!');
            } else {
                this.addModal.show();
                this.showInformationModal('error', rsp.message);
            }

            Utils.showSpinner(false);
        }, err => Utils.log(err));
    }

    openEdit(obj) {
        this.isEdit = true;
        this.addModal.show();
        this.code = obj.code;
        this.displayAs = obj.displayAs;
    }

    update() {
        let errors = this.validate();
        if (errors.length > 0) {
            errors.forEach(err => {
                this.showInformationModal('error', err);
            });
            return;
        }

        this.addModal.hide();
        Utils.showSpinner(true);

        let x = {
            "code": this.code,
            "displayAs": this.displayAs
        };

        this.pro.update(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.search(1);
                this.showInformationModal('success', 'Update success!');
            } else {
                this.addModal.show();
                this.showInformationModal('error', rsp.message);
            }

            Utils.showSpinner(false);
        }, err => Utils.log(err));
    }

    public showInformationModal(type: string, message: string = '') {
        if (type == 'error') {
            this.toastr.error('Lỗi xảy ra !', message, {
                timeOut: 3000,
                closeButton: true,
                progressBar: true,
                positionClass: 'toast-top-center'
            });
        }
        else if (type == 'success') {
            this.toastr.success('Thành công !', message, {
                timeOut: 3000,
                closeButton: true,
                progressBar: true,
                positionClass: 'toast-top-center'
            });
        }
    }

    getPages() {
        return new Array(this.totalPages);
    }
}

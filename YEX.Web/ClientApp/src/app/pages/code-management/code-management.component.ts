import { Component, OnInit, ViewChild } from '@angular/core';
import { Utils, Token } from 'src/app/utilities';
import { ToastrService } from 'ngx-toastr';
import { CodeTypeProvider } from 'src/app/providers';
import { ModalDirective } from 'ngx-bootstrap';
import { CodeProvider } from 'src/app/providers/code';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';

@Component({
    selector: 'app-code-management',
    templateUrl: './code-management.component.html',
    styleUrls: ['./code-management.component.css']
})
export class CodeManagementComponent implements OnInit {

    @ViewChild('addModal', { static: false }) public addModal: ModalDirective;

    public Editor = ClassicEditor;

    public types = [];
    public data = [];

    public vm = { id: 0, codeType: '', value: null, displayAs: '', sequence: 1, imageBase64: null };

    public totalPages = 1;
    public pageSize = 10;
    public currentPage = 1;
    public typeFilter = '';

    public isEdit = false;
    public isImageType = false;

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
        private pro: CodeProvider,
        private proType: CodeTypeProvider,
        private toastr: ToastrService
    ) {
        this.getCurUser();
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

    ngOnInit() {
        this.search(1);
        this.loadCodeType();
    }

    handlerTypeFilter(event) {
        let codeType = event.target.value;
        this.vm.codeType = codeType;
        this.isImageType = this.getIsImageType(codeType);
        this.search(1);
    }

    loadCodeType() {
        Utils.showSpinner(true);

        let x = {
            page: 1,
            size: 20
        };

        this.proType.search(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.types = rsp.data.data;
            }
            Utils.showSpinner(false);
        });
    }

    getIsImageType(value: string) {
        if (value == null) {
            return false;
        }

        let lower = value.toLowerCase();
        return lower.includes('image') || lower.includes('banner');
    }

    handlerCodeType(event) {
        let codeType = event.target.value;
        this.isImageType = this.getIsImageType(codeType);
    }

    handlerUpload($event) {
        this.previewImage($event.target);
    }

    previewImage(inputValue: any): void {
        var file: File = inputValue.files[0];
        var myReader: FileReader = new FileReader();

        myReader.onloadend = (e) => {
            this.vm.value = myReader.result;
            this.vm.imageBase64 = myReader.result.toString().replace('data:image/jpeg;base64,', '').replace('data:image/png;base64,', '');
        }
        myReader.readAsDataURL(file);
    }

    getPathWithSub(path, dir) {
        if (path == null) return;

        let filename = path.split(/(\\|\/)/g).pop();
        let subfolder = filename.replace('big', dir);
        return path.replace(filename, subfolder);
    }

    search(page: any) {
        Utils.showSpinner(true);
        this.currentPage = page;

        let x = {
            page: page,
            size: this.pageSize,
            filter: {
                codeType: this.typeFilter
            }
        };

        this.pro.search(x).subscribe((rsp: any) => {
            if (rsp.success) {
                rsp.data.map(x => {
                    if (this.getIsImageType(x.codeType)) {
                        x.thumb = this.getPathWithSub(x.value, "small");
                    }
                });

                this.data = rsp.data;
                this.totalPages = rsp.totalPages;
            } else {
                this.data = [];
                this.showInformationModal('error', rsp.message);
            }

            Utils.showSpinner(false);
        }, err => Utils.log(err));
    }

    openAdd() {
        this.isEdit = false;

        let config: any = {
            backdrop: true,
            ignoreBackdropClick: false
        };
        this.addModal.config = config;
        this.addModal.show();

        // Set field default
        this.vm.displayAs = null;
        this.vm.value = null;
        this.vm.displayAs = null;
    }

    validate() {
        let errors = [];

        if (this.vm.codeType == null || this.vm.codeType.trim() == '') {
            errors.push('Please enter code type');
        }

        if (this.vm.value == null || this.vm.value.trim() == '') {
            errors.push('Please enter value');
        }

        if (!this.isImageType && (this.vm.displayAs == null || this.vm.displayAs.trim() == '')) {
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

        console.log(this.vm.imageBase64);

        let x = {
            "codeType": this.vm.codeType,
            "value": this.vm.value,
            "displayAs": this.vm.displayAs,
            "sequence": this.vm.sequence,
            "imageBase64": this.vm.imageBase64,
            "createdBy": this.curUser.id
        };

        this.pro.add(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.search(1);
                this.showInformationModal('success', 'Create success!');
            } else {
                this.addModal.show();
                console.log(rsp.message);
                this.showInformationModal('error', rsp.message);
            }

            Utils.showSpinner(false);
        }, err => Utils.log(err));
    }

    openEdit(obj) {
        this.isEdit = true;
        this.addModal.show();

        // Set field data at selected item
        this.vm.id = obj.id;
        this.vm.codeType = obj.codeType;
        this.vm.value = this.getPathWithSub(obj.value, "medium");;
        this.vm.displayAs = obj.displayAs;

        this.isImageType = this.getIsImageType(obj.codeType);
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
            "id": this.vm.id,
            "codeType": this.vm.codeType,
            "value": this.vm.value,
            "displayAs": this.vm.displayAs,
            "sequence": this.vm.sequence,
            "imageBase64": this.vm.imageBase64,
            "modifiedBy": this.curUser.id
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

import { Component, OnInit, ViewChild } from '@angular/core';
import { HomeProvider } from 'src/app/providers';
import { ModalDirective } from 'ngx-bootstrap';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import { Utils, Token } from 'src/app/utilities';
import { ToastrService } from 'ngx-toastr';
import { CodeProvider } from 'src/app/providers/code';

@Component({
    selector: 'app-news-management',
    templateUrl: './news-management.component.html',
    styleUrls: ['./news-management.component.css']
})
export class NewsManagementComponent implements OnInit {

    @ViewChild('addModal', { static: false }) public addModal: ModalDirective;

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

    public Editor = ClassicEditor;

    public types = [];
    public categorys = [];
    public data = [];

    public vm = { id: 0, title: '', type: '', category: '', content: '', brief: '', avatar: null, imageBase64: null };

    public totalPages = 1;
    public pageSize = 10;
    public currentPage = 1;
    public typeFilter = '';
    public categoryFilter = '';
    public isEdit = false;

    constructor(
        private pro: HomeProvider,
        private proCode: CodeProvider,
        private toastr: ToastrService
    ) {
        this.getCurUser();
    }

    ngOnInit() {
        this.search(1);
        this.loadTypeCategory();
    }

    loadTypeCategory() {
        let x = {
            Keyword: "NewsType;NewsCategory"
        };

        this.proCode.searchByTypes(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.types = rsp.data.NewsType;
                this.categorys = rsp.data.NewsCategory;
            } else {
                this.types = [];
                this.showInformationModal('error', rsp.message);
            }
        }, err => Utils.log(err));
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

    search(page: any) {
        Utils.showSpinner(true);
        this.currentPage = page;

        let x = {
            page: page,
            size: this.pageSize,
            filter: {
                TypeCode: this.typeFilter,
                CategoryCode: this.categoryFilter
            }
        };

        this.pro.loadMoreNews(x).subscribe((rsp: any) => {
            if (rsp.success) {
                rsp.data.data.map(x => {
                    x.thumb = this.getPathWithSub(x.value, "small");
                });

                this.data = rsp.data.data;
                this.totalPages = rsp.data.totalPages;
            } else {
                this.data = [];
                this.showInformationModal('error', rsp.message);
            }

            Utils.showSpinner(false);
        }, err => Utils.log(err));
    }


    validate() {
        let errors = [];

        if (this.vm.title == null || this.vm.title.trim() == '') {
            errors.push('Vui lòng nhập vào tiêu đề!');
        }

        if (this.vm.type == null || this.vm.type.trim() == '') {
            errors.push('Vui lòng chọn loại!');
        }

        if (this.vm.category == null || this.vm.category.trim() == '') {
            errors.push('Vui lòng chọn danh mục!');
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
            "title": this.vm.title,
            "brief": this.vm.brief,
            "content": this.vm.content,
            "category": this.vm.category,
            "newsType": this.vm.type,
            "imageBase64": this.vm.imageBase64
        };

        this.pro.createNews(x).subscribe((rsp: any) => {
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
            "title": this.vm.title,
            "brief": this.vm.brief,
            "content": this.vm.content,
            "category": this.vm.category,
            "newsType": this.vm.type,
            "imageBase64": this.vm.imageBase64
        };

        this.pro.updateNews(x).subscribe((rsp: any) => {
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

    handlerTypeFilter(event) {
        let type = event.target.value;
        this.vm.type = type;
        this.search(1);
    }

    handlerType(event) {
        // let type = event.target.value;
        // this.isImageType = this.getIsImageType(codeType);
    }

    handlerUpload($event) {
        this.previewImage($event.target);
    }

    previewImage(inputValue: any): void {
        var file: File = inputValue.files[0];
        var myReader: FileReader = new FileReader();

        myReader.onloadend = (e) => {
            this.vm.avatar = myReader.result;
            this.vm.imageBase64 = myReader.result.toString().replace('data:image/jpeg;base64,', '').replace('data:image/png;base64,', '');
        }
        myReader.readAsDataURL(file);
    }

    openAdd() {
        this.isEdit = false;
        this.addModal.show();
        // Set field default
        this.vm.imageBase64 = null;
        this.vm.avatar = null;
        this.vm.title = '';
        this.vm.type = '';
        this.vm.category = '';
        this.vm.brief = '';
        this.vm.content = '';
    }

    openEdit(obj) {
        this.isEdit = true;
        this.addModal.show();

        // Set field data at selected item
        this.vm.id = obj.id;
        this.vm.type = obj.newsType;
        this.vm.category = obj.categoryName;
        this.vm.avatar = this.getPathWithSub(obj.imgUrl, "medium");
        this.vm.title = obj.title;
        this.vm.brief = obj.brief;
        this.vm.content = obj.content;
    }

    getPathWithSub(path, dir) {
        if (path == null) return;

        let filename = path.split(/(\\|\/)/g).pop();
        let subfolder = filename.replace('big', dir);
        return path.replace(filename, subfolder);
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

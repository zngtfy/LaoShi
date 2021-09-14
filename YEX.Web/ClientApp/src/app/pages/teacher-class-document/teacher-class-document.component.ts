import { Component, ViewChild, OnInit } from '@angular/core';
import { HttpHeaders } from '@angular/common/http';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { Utils, Token } from '../../utilities';
import { TeacherProvider, FileProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    selector: 'app-teacher-class-document',
    templateUrl: './teacher-class-document.component.html',
    styleUrls: ['./teacher-class-document.component.css']
})
export class TeacherClassDocumentComponent implements OnInit {
    @ViewChild('confirmModal', { static: true }) public confirmModal: ModalDirective;
    @ViewChild('editModal', { static: true }) public editModal: ModalDirective;
    selectStyleBtn: any = {};
    show: boolean = false;
    message: any = '';
    curClass: any = null;
    classes: any = [];
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
    //////////////////
    docType: any = '';
    selectType: any = false;
    documents: any = [];
    isEdit = true;
    editingDoc: any = {
        id: 0,
        title: "",
        classId: 0,
        description: "",
        linkUrl: "",
        documentType: 0,
        type: "",
        content: '',
        createdOn: null,
        createdBy: 0,
        status: 1,
        modifiedBy: null,
        modifiedOn: null,
        createdByName: "",
        modifiedByName: ""
    };

    constructor(
        private router: Router,
        private proTeacher: TeacherProvider,
        private toastr: ToastrService,
        private proFile: FileProvider,
    ) { }

    ngOnInit(): void {
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
            this.getTeacherAllClass();
        }
    }

    getTeacherAllClass() {
        Utils.showSpinner(true);

        let x = {
            userId: this.curUser.id,
            status: 1
        };

        this.proTeacher.getTeacherAllClass(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.classes = rsp.data;
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

    changeClass(e) {
        if (e.target.value != "") {
            var index = parseInt(e.target.value) - 1;
            this.curClass = this.classes[index];
        }
        else {
            this.curClass = null;
        }
    }

    selectClass() {
        this.show = true;
        this.selectStyleBtn = { display: 'none' };
        //this.getTeacherClassById();
    }

    unSelectClass() {
        this.show = false;
        this.selectStyleBtn = {};
        this.selectType = false;
        this.docType = '';
    }

    /////////////////////// - start
    selectDocType() {
        this.selectType = true;
        this.getTeacherClassDocument();
    }

    unSelectDocType() {
        this.selectType = false;
    }

    getTeacherClassDocument() {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.classId,
            documentType: this.docType
        };

        this.proTeacher.getTeacherClassDocument(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
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

    downloadMaterial(i) {
        var item = this.documents[i];
        var dot = item.linkUrl.indexOf(".");
        var ext = item.linkUrl.substr(dot, item.linkUrl.length);
        //console.log(item.documentType + `_` + item.id + ext);
        this.proFile.download(item.linkUrl).subscribe(data => saveAs(data, item.documentType + `_` + item.id + ext));
    }

    openEditModal(i) {
        if (i == null) {
            this.isEdit = false;
            this.editingDoc = {
                id: 0,
                title: "",
                classId: this.curClass.classId,
                description: "",
                linkUrl: "",
                documentType: this.docType,
                type: "",
                content: '',
                createdOn: null,
                createdBy: this.curUser.id,
                status: 1,
                modifiedBy: null,
                modifiedOn: null,
                createdByName: "",
                modifiedByName: ""
            };
        }
        else {
            this.isEdit = true;
            var doc = this.documents[i];
            this.editingDoc = {
                id: doc.id,
                title: doc.title,
                classId: doc.classId,
                description: doc.description,
                linkUrl: doc.linkUrl,
                documentType: doc.documentType,
                type: doc.type,
                content: doc.content,
                createdOn: doc.createdOn,
                createdBy: doc.createdBy,
                status: doc.status,
                modifiedBy: this.curUser.id,
                modifiedOn: doc.modifiedOn,
                createdByName: doc.createdByName,
                modifiedByName: doc.modifiedByName
            };
            //(this.editingDoc);
        }
        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.editModal.config = config;
        this.editModal.show();

        const d: HTMLInputElement = document.getElementById('docFile') as HTMLInputElement;
        //console.log(d);
        if (d != null)
            d.value = null;
    }

    deleteDoc(i) {
        var doc = this.documents[i];
        this.editingDoc = {
            id: doc.id,
            title: doc.title,
            classId: doc.classId,
            description: doc.description,
            linkUrl: doc.linkUrl,
            documentType: doc.documentType,
            type: doc.type,
            content: doc.content,
            createdOn: doc.createdOn,
            createdBy: doc.createdBy,
            status: doc.status,
            modifiedBy: this.curUser.id,
            modifiedOn: doc.modifiedOn,
            createdByName: doc.createdByName,
            modifiedByName: doc.modifiedByName
        };
        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.confirmModal.config = config;
        this.confirmModal.show();
    }

    deleteDocument() {
        Utils.showSpinner(true);

        let x = {
            id: this.editingDoc.id
        };

        this.proTeacher.deleteTeacherClassDocument(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                var i = 0;
                for (i = 0; i < this.documents.length; i++) {
                    if (this.documents[i].id == this.editingDoc.id)
                        break;
                }
                this.documents.splice(i, 1);
                this.editingDoc = {
                    id: 0,
                    title: "",
                    classId: this.curClass.classId,
                    description: "",
                    linkUrl: "",
                    documentType: this.docType,
                    type: "",
                    content: '',
                    createdOn: null,
                    createdBy: this.curUser.id,
                    status: 1,
                    modifiedBy: null,
                    modifiedOn: null,
                    createdByName: "",
                    modifiedByName: ""
                };
                this.confirmModal.hide();
                this.showToastSuccess("Bạn đã xóa thành công tài liệu !!");
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

    downloadDocument(id) {
        var arr = this.documents.filter(x => x.id == id);
        let item: any = arr[0];

        var dot = item.linkUrl.indexOf(".");
        var ext = item.linkUrl.substr(dot, item.linkUrl.length);
        this.proFile.download(item.linkUrl).subscribe(data => saveAs(data, item.documentType + `_` + item.id + ext));
    }

    saveDocument() {
        if (this.checkSameDoc()) {
            this.showToastError("Không có thay đổi để cập nhật !!");
        }
        else {
            var str = this.checkFull();
            if (str == "") {
                //console.log("OK-to-Save");
                //console.log(this.editingDoc);
                this.saveTeacherClassDocument();
            }
            else {
                this.showToastError(str);
            }
        }
    }

    saveTeacherClassDocument() {
        const formData = new FormData();
        let chkStr = "";

        const d: HTMLInputElement = document.getElementById('docFile') as HTMLInputElement;
        if (d.files.length > 0) {
            if (d.files.length == 1) {
                var file = d.files[0];
                formData.append('files', file);
            }
            else
                chkStr = "Bạn chỉ được upload 1 file duy nhất !!";
        }

        this.editingDoc.modifiedBy = this.curUser.id;
        formData.append('ClassDocument', JSON.stringify(this.editingDoc));

        // Headers
        let token = '';
        token = Token.getToken();
        let t = new HttpHeaders().set('Authorization', token);
        //t = t.append('Content-Type', 'multipart/form-data');

        if (chkStr == "") {
            Utils.showSpinner(true);
            this.proTeacher.saveTeacherClassDocument(formData)
                .subscribe((rsp: any) => {
                    if (rsp.success) {
                        //console.log(rsp.data);
                        this.editingDoc.title = rsp.data.title;
                        this.editingDoc.description = rsp.data.description;
                        this.editingDoc.linkUrl = rsp.data.linkUrl;
                        this.editingDoc.content = rsp.data.content;
                        this.editingDoc.createdBy = rsp.data.createdBy;
                        this.editingDoc.createdOn = rsp.data.createdOn;
                        this.editingDoc.status = rsp.data.status;
                        this.editingDoc.modifiedOn = rsp.data.modifiedOn;
                        this.editingDoc.modifiedByName = rsp.data.modifiedByName;
                        this.editingDoc.createdByName = rsp.data.createdByName;
                        var i = 0;
                        for (i = 0; i < this.documents.length; i++) {
                            if (this.documents[i].id == this.editingDoc.id)
                                break;
                        }
                        this.documents[i] = rsp.data;
                        this.showToastSuccess("Đã cập nhật bài tập thành công !");

                        const d: HTMLInputElement = document.getElementById('docFile') as HTMLInputElement;
                        if (d != null)
                            d.value = null;

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
        else {
            this.showToastError(chkStr);
        }
    }

    checkSameDoc() {
        var arr1 = this.documents.filter(d => d.id == this.editingDoc.id);
        var item = arr1[0];
        if (this.editingDoc.classId != item.classId)
            return false;
        if (this.editingDoc.title != item.title)
            return false;
        if (this.editingDoc.description != item.description)
            return false;
        if (this.editingDoc.linkUrl != item.linkUrl)
            return false;
        if (this.editingDoc.content != item.content)
            return false;
        if (this.editingDoc.type != item.type)
            return false;
        if (this.isEdit) {
            const d: HTMLInputElement = document.getElementById('docFile') as HTMLInputElement;
            if (d.files.length == 1)
                return false;
        }

        return true;
    }

    checkFull() {
        var str = "";
        if (this.editingDoc.title.trim() == "")
            str = str + "Bạn vui lòng nhập [Tên tài liệu ]. <br/>";
        if (this.editingDoc.description.trim() == "")
            str = str + "Bạn vui lòng nhập [Mô tả tài liệu ]. <br/>";
        if (this.editingDoc.content.trim() == "")
            str = str + "Bạn vui lòng nhập [Nội dung tài liệu ]. <br/>";
        return str;
    }

    createDocument() {
        const d: HTMLInputElement = document.getElementById('docFile') as HTMLInputElement;
        if (d.files.length == 0) {
            this.showToastError("Bạn chưa chọn File cần upload cho tài liệu !");
        }
        else {
            var str = this.checkFull();
            if (str == "") {
                //(this.editingDoc);
                //console.log("OK-to-Create");
                this.createTeacherClassDocument();
            }
            else {
                this.showToastError(str);
            }
        }
    }

    createTeacherClassDocument() {
        const formData = new FormData();
        let chkStr = "";

        const d: HTMLInputElement = document.getElementById('docFile') as HTMLInputElement;
        if (d.files.length > 0) {
            if (d.files.length == 1) {
                var file = d.files[0];
                formData.append('files', file);
            }
            else
                chkStr = "Bạn chỉ được upload 1 file duy nhất !!";
        }
        this.editingDoc.type = this.getType(this.editingDoc.documentType);
        formData.append('ClassDocument', JSON.stringify(this.editingDoc));

        // Headers
        let token = '';
        token = Token.getToken();
        let t = new HttpHeaders().set('Authorization', token);
        //t = t.append('Content-Type', 'multipart/form-data');

        if (chkStr == "") {
            Utils.showSpinner(true);
            this.proTeacher.createTeacherClassDocument(formData)
                .subscribe((rsp: any) => {
                    if (rsp.success) {
                        //console.log(rsp.data);
                        var item = JSON.parse(JSON.stringify(rsp.data));
                        this.editingDoc = item;
                        this.documents.push(item);

                        this.isEdit = true;

                        const d: HTMLInputElement = document.getElementById('docFile') as HTMLInputElement;
                        if (d != null)
                            d.value = null;

                        this.showToastSuccess("Đã thêm mới tài liệu thành công !");
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
        else {
            this.showToastError(chkStr);
        }
    }

    getType(docType)
    {
        if(docType=="DCMH" || docType=="Book" || docType=="DocThem" || docType=="BaiTap" || docType=="DeThiMau")
            return "Doc";
        else if(docType=="BaiGiang")
            return "Slide";
        else if(docType=="SourceCode")
            return "Zip";
        else
            return "";
    }

    /////////////////////////////////// - End

    showToastSuccess(info) {
        this.toastr.success(info, 'Thông báo !', {
            timeOut: 4000,
            positionClass: 'toast-top-center',
            closeButton: true,
            progressBar: true,
            enableHtml: true
        });
    }

    showToastError(info) {
        this.toastr.warning(info, 'Thông báo !', {
            timeOut: 3000,
            positionClass: 'toast-top-center',
            closeButton: true,
            progressBar: true,
            enableHtml: true
        });
    }

    formatDate(str) {
        return moment(str).format('DD/MM/YYYY');
    }
    formatDate1(str) {
        return moment(str).format('DD/MM/YYYY HH:mm');
    }

}

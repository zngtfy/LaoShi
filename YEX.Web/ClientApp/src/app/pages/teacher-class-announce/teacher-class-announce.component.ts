import { Component, ViewChild, OnInit } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { Utils, Token } from '../../utilities';
import { TeacherProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';
import * as ClassicEditor from '@ckeditor/ckeditor5-build-classic';

@Component({
    selector: 'app-teacher-class-announce',
    templateUrl: './teacher-class-announce.component.html',
    styleUrls: ['./teacher-class-announce.component.css']
})
export class TeacherClassAnnounceComponent implements OnInit {
    public Editor = ClassicEditor;
    @ViewChild('confirmModal', { static: true }) public confirmModal: ModalDirective;
    @ViewChild('editModal', { static: true }) public editModal: ModalDirective;
    size: number = 5;
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
    ///
    announcements: any = {
        data: [],
        totalRecords: 0,
        page: 0,
        size: 5,
        totalPages: 0,
    };
    isEdit = false;
    editingAnnouncement: any = {
        id: 0,
        title: "",
        classId: 0,
        brief: "",
        type: "",
        content: "",
        createdOn: null,
        status: 1,
        createdBy: null,
        modifiedBy: null,
        modifiedOn: null,
        createdByName: "",
        modifiedByName: ""
    };

    constructor(
        private router: Router,
        private proTeacher: TeacherProvider,
        private toastr: ToastrService,
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
        this.getTeacherClassAnnouncement(1);
    }

    unSelectClass() {
        this.show = false;
        this.selectStyleBtn = {};
    }

    /////////////////////
    getTeacherClassAnnouncement(cPage) {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.classId,
            page: cPage,
            size: this.size
        };

        this.proTeacher.getTeacherClassAnnouncement(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.announcements = rsp.data;
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
        //console.log('Page changed to: ' + event.page);
        //console.log('Number items per page: ' + event.itemsPerPage);
        this.getTeacherClassAnnouncement(event.page);
    }
    getSTT(i) {
        var page = this.announcements.page;
        var stt = (page - 1) * this.size;
        stt = stt + i + 1;
        return stt;
    }

    deleteAnnounce(i) {
        this.editingAnnouncement = this.announcements.data[i];
        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.confirmModal.config = config;
        this.confirmModal.show();
    }

    deleteAnnouncement() // dong y
    {
        Utils.showSpinner(true);

        let x = {
            id: this.editingAnnouncement.id
        };

        this.proTeacher.deleteTeacherClassAnnouncement(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                var i = 0;
                for (i = 0; i < this.announcements.data.length; i++) {
                    if (this.announcements.data[i].id == this.editingAnnouncement.id)
                        break;
                }
                this.announcements.data.splice(i, 1);
                this.editingAnnouncement = {
                    id: 0,
                    title: "",
                    classId: 0,
                    brief: "",
                    type: "",
                    content: "",
                    createdOn: null,
                    status: 1,
                    createdBy: null,
                    modifiedBy: null,
                    modifiedOn: null,
                    createdByName: "",
                    modifiedByName: ""
                };
                this.confirmModal.hide();
                this.showToastSuccess("Bạn đã xóa thành công thông báo !!");
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

    openEditModal(i) {
        if (i == null) {
            this.isEdit = false;
            this.editingAnnouncement = {
                id: 0,
                title: "",
                classId: this.curClass.classId,
                brief: "",
                type: "",
                content: "",
                createdOn: null,
                status: 1,
                createdBy: this.curUser.id,
                modifiedBy: null,
                modifiedOn: null,
                createdByName: "",
                modifiedByName: ""
            };
        }
        else {
            this.isEdit = true;
            var item = this.announcements.data[i];
            this.editingAnnouncement = {
                id: item.id,
                title: item.title,
                classId: item.classId,
                brief: item.brief,
                type: item.type,
                content: item.content,
                createdOn: item.createdOn,
                status: item.status,
                createdBy: item.createdBy,
                modifiedBy: this.curUser.id,
                modifiedOn: item.modifiedOn,
                createdByName: item.createdByName,
                modifiedByName: item.modifiedByName
            };
            //console.log(this.editingAnnouncement);
        }
        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.editModal.config = config;
        this.editModal.show();
    }

    saveAnnounce() // luu
    {
        if (this.checkSame()) {
            this.showToastError("Không có thay đổi để cập nhật !!");
        }
        else {
            var str = this.checkFull();
            if (str == "") {
                //console.log("OK-to-Save");
                //console.log(this.editingAnnouncement);
                this.saveTeacherClassAnnouncement();
            }
            else {
                this.showToastError(str);
            }
        }
    }

    saveTeacherClassAnnouncement() {
        Utils.showSpinner(true);

        let x = this.editingAnnouncement;

        this.proTeacher.saveTeacherClassAnnouncement(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.editingAnnouncement.title = rsp.data.title;
                this.editingAnnouncement.type = rsp.data.type;
                this.editingAnnouncement.brief = rsp.data.brief;
                this.editingAnnouncement.content = rsp.data.content;
                this.editingAnnouncement.createdBy = rsp.data.createdBy;
                this.editingAnnouncement.createdOn = rsp.data.createdOn;
                this.editingAnnouncement.status = rsp.data.status;
                this.editingAnnouncement.modifiedOn = rsp.data.modifiedOn;
                this.editingAnnouncement.modifiedByName = rsp.data.modifiedByName;
                this.editingAnnouncement.createdByName = rsp.data.createdByName;
                var i = 0;
                for (i = 0; i < this.announcements.data.length; i++) {
                    if (this.announcements.data[i].id == this.editingAnnouncement.id)
                        break;
                }
                this.announcements.data[i] = rsp.data;
                this.showToastSuccess("Đã cập nhật thông báo thành công !");
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

    checkSame() {
        var arr1 = this.announcements.data.filter(d => d.id == this.editingAnnouncement.id);
        var item = arr1[0];
        if (this.editingAnnouncement.type != item.type)
            return false;
        if (this.editingAnnouncement.title != item.title)
            return false;
        if (this.editingAnnouncement.brief != item.brief)
            return false;
        if (this.editingAnnouncement.content != item.content)
            return false;
        return true;
    }

    checkFull() {
        var str = "";
        if (this.editingAnnouncement.type == "")
            str = str + "Bạn vui lòng chọn [loại hình thông báo]. <br/>";
        if (this.editingAnnouncement.title.trim() == "")
            str = str + "Bạn vui lòng nhập [Tiêu đề thông báo]. <br/>";
        if (this.editingAnnouncement.brief.trim() == "")
            str = str + "Bạn vui lòng nhập [Tóm tắt thông báo]. <br/>";
        if (this.editingAnnouncement.content.trim() == "")
            str = str + "Bạn vui lòng nhập [Nội dung thông báo ]. <br/>";
        return str;
    }

    createAnnounce() // them
    {
        var str = this.checkFull();
        if (str == "") {
            //console.log(this.editingAnnouncement);
            //console.log("OK-to-Create");
            this.createTeacherClassAnnouncement();
        }
        else {
            this.showToastError(str);
        }
    }

    createTeacherClassAnnouncement()
    {
        Utils.showSpinner(true);

        let x = this.editingAnnouncement;

        this.proTeacher.createTeacherClassAnnouncement(x).subscribe((rsp: any) => {
            if (rsp.success) {
                var item = JSON.parse(JSON.stringify(rsp.data));
                this.editingAnnouncement = item;
                this.announcements.data.unshift(item);

                this.isEdit = true;

                this.showToastSuccess("Đã thêm mới thông báo thành công !");
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
    /////////////////////

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

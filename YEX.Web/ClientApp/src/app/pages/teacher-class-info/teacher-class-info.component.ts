import { Component, ViewChild, OnInit } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { Utils, Token } from '../../utilities';
import { TeacherProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    selector: 'app-teacher-class-info',
    templateUrl: './teacher-class-info.component.html',
    styleUrls: ['./teacher-class-info.component.css']
})
export class TeacherClassInfoComponent implements OnInit {
    @ViewChild('warningModal', { static: false }) public warningModal: ModalDirective;
    @ViewChild('warningModalSession', { static: false }) public warningModalSession: ModalDirective;
    @ViewChild('sessionModal', { static: false }) public sessionModal: ModalDirective;
    selectStyleBtn: any = {};
    message: any = '';
    curClass: any = null;
    editingClass: any = {
        id: 0,
        code: "",
        name: "",
        subjectId: 0,
        venue: "0",
        description: "Lớp học lại cho khóa 205 trở về trước, ngành KHMT",
        classTime: "Lý thuyết: tiết 7-10 thứ Sáu, Thực hành: tiết 1-6 thứ Sáu",
        startDate: "2020-02-07T00:00:00",
        endDate: "2020-05-01T00:00:00",
        prerequisition: "Học môn nhập môn tin học",
        images: "assets/subject/ctdl_ou.png",
        semester: 2,
        schoolYear: "2019-2020",
        totalSession: 20,
        note: "10 buổi LT, 10 buổi TH",
        teacherId: 1,
        status: 1,
    };
    editingSessions: any = [];
    session: number = 0;
    isEditing: boolean = true;
    isDeleteSession: boolean = false;
    curSessionAction: any = {
        index: 0,
        sessionId: 0
    };
    editingSession: any = {
        id: 0,
        classId: 1,
        session: "LT-01",
        brief: "Chương 1",
        classContent: "Chương 1",
        dateOfClass: "2020-02-07T00:00:00",
        sessionType: "LT",
        fromTime: "13:00",
        toTime: "16:00",
        totalClassUnit: 4,
        location: "OU - NK.002",
        note: "Buổi 1 - Lý thuyết",
        status: 1,
        createdBy: 1,
        createdOn: "2019-12-01T00:00:00",
        modifiedBy: null,
        modifiedOn: null
    };
    editingTeachers: any = [];
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

    show: boolean = false;
    isDisable: boolean = false;

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
        this.getTeacherClassById();
    }

    unSelectClass() {
        this.show = false;
        this.selectStyleBtn = {};
    }

    getTeacherClassById() {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.classId
        };

        this.proTeacher.getTeacherClassById(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingClass = rsp.data.class;
                this.editingSessions = rsp.data.sessions;
                this.editingTeachers = rsp.data.teachers;
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

    dateChanged(eventDate: string): Date | null {
        return !!eventDate ? new Date(eventDate) : null;
    }

    saveClassInfo() {
        //console.log(this.editingClass);
        this.saveTeacherClassInfo();
    }

    saveTeacherClassInfo() {
        Utils.showSpinner(true);

        let x = this.editingClass;
        x.modifiedBy = this.curUser.id;

        this.proTeacher.saveTeacherClassInfo(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingClass = rsp.data;
                this.showToastSuccess("Bạn đã cập nhật thông tin lớp học thành công !");
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

    completeClass() {
        this.warningModal.show();
    }

    completeClassNext() {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.classId,
            modifiedBy: this.curUser.id
        };

        this.proTeacher.completeClassNext(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingClass = rsp.data;
                this.warningModal.hide();
                this.showToastSuccess("Bạn đã chuyển trạng thái lớp học thành công !");
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

    //  session
    openSessionModal(index) {
        if (index == null) {
            this.editingSession = {
                id: 0,
                classId: this.curClass.classId,
                session: '',
                brief: "",
                classContent: "",
                dateOfClass: null,
                sessionType: "",
                fromTime: "",
                toTime: "",
                totalClassUnit: 0,
                location: "",
                note: "",
                status: 1,
                createdBy: this.curUser.id
            };
            this.session = 0;
            this.isEditing = false;
        }
        else {
            var item = this.editingSessions[index];
            this.editingSession = {
                id: item.id,
                classId: item.classId,
                session: item.session,
                brief: item.brief,
                classContent: item.classContent,
                dateOfClass: item.dateOfClass,
                sessionType: item.sessionType,
                fromTime: item.fromTime,
                toTime: item.toTime,
                totalClassUnit: item.totalClassUnit,
                location: item.location,
                note: item.note,
                status: item.status,
                modifiedBy: this.curUser.id
            };
            var arr = item.session.split('-');
            this.session = parseInt(arr[arr.length - 1]);
            this.isEditing = true;
        }
        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.sessionModal.config = config;
        this.sessionModal.show();
    }

    saveSession() {
        if (this.checkSessionNo() == 1) {
            var str = this.checkFullSession();
            if (str != "")
                this.showToastError(str);
            else {
                if (this.checkSameSession())
                    this.showToastError("Bạn không có thay đổi gì!");
                else {
                    this.saveClassSession();
                }
            }
        }
        else {
            var str = "Bạn đã có buổi học [" + this.editingSession.sessionType + "] thứ " + this.session + " rồi! Thứ tự không đúng!";
            this.showToastError(str);
        }
    }

    saveClassSession() {
        Utils.showSpinner(true);

        let x = this.editingSession;

        this.proTeacher.saveClassSession(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingSession = rsp.data;
                var index = 0;
                for (var i = 0; i < this.editingSessions.length; i++)
                    if (this.editingSessions[i].id == rsp.data.id) {
                        index = i;
                        break;
                    }
                this.editingSessions[index] = rsp.data;
                this.isEditing = true;
                this.showToastSuccess('<p class="small">Bạn đã cập nhật thành công ! </p>');
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

    createSession() {
        if (this.checkSessionNo() == 0) {
            var str = this.checkFullSession();
            if (str != "")
                this.showToastError('<p class="text-small small">' + str + '</p>');
            else {
                this.createNewSession();
            }
        }
        else {
            var str = "Bạn đã có buổi học [" + this.editingSession.sessionType + "] thứ " + this.session + " rồi! Thứ tự không đúng!";
            this.showToastError(str);
        }
    }

    createNewSession() {
        Utils.showSpinner(true);

        let x = this.editingSession;
        x.session = this.editingSession.sessionType +"-"+ this.session.toString();

        //console.log(x);
        this.proTeacher.createNewClassSession(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingClass= rsp.data.class;
                this.editingSession = rsp.data.session;
                this.editingSessions.push(rsp.data.session);
                this.isEditing = true;
                this.showToastSuccess('<p class="small">Bạn đã tạo mới thành công ! </p>');
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

    checkSameSession() {
        var arr1 = this.editingSessions.filter(d => d.id == this.editingSession.id);
        var item = arr1[0];
        if (this.editingSession.classId != item.classId)
            return false;
        if (this.editingSession.brief != item.brief)
            return false;
        if (this.editingSession.classContent != item.classContent)
            return false;
        if (this.editingSession.dateOfClass != item.dateOfClass)
            return false;
        if (this.editingSession.fromTime != item.fromTime)
            return false;
        if (this.editingSession.toTime != item.toTime)
            return false;
        if (this.editingSession.totalClassUnit != item.totalClassUnit)
            return false;
        if (this.editingSession.location != item.location)
            return false;
        if (this.editingSession.note != item.note)
            return false;
        return true;
    }

    checkSessionNo() {
        var n = 0;
        for (var i = 0; i < this.editingSessions.length; i++) {
            let item = this.editingSessions[i];
            var arr = item.session.split('-');
            let sessNo = parseInt(arr[arr.length - 1]);
            if (item.sessionType == this.editingSession.sessionType && this.session == sessNo) {
                n++;
            }
        }
        return n;
    }

    checkFullSession() {
        var str = "";
        if (this.editingSession.dateOfClass == null)
            str = str + "Vui lòng kiểm tra [Ngày học].<br/>";
        if (this.isValidTime(this.editingSession.fromTime) == false)
            str = str + " Định dạng [Thời gian bắt đầu] không đúng.<br/>"
        if (this.isValidTime(this.editingSession.toTime) == false)
            str = str + "Định dạng [Thời gian kết thúc] không đúng.<br/>"
        if (this.editingSession.totalClassUnit == 0)
            str = str + "Vui lòng kiểm tra [Tổng số tiết].<br/>";
        if (this.editingSession.location.trim().length == 0)
            str = str + "Vui lòng nhập liệu cho [phòng học].<br/>";
        if (this.editingSession.sessionType == null || this.editingSession.sessionType == "")
            str = str + "Vui lòng kiểm tra [Hình thức buổi học].<br/>";
        if (this.editingSession.brief.trim().length == 0)
            str = str + "Vui lòng nhập liệu cho [Tóm tắt buổi học].<br/>";
        return str;
    }

    completeSession(i, sid) {
        this.isDeleteSession = false;
        this.warningModalSession.show();
        this.curSessionAction = {
            index: i,
            sessionId: sid
        };
    }

    deleteSession(i, sid) {
        this.isDeleteSession = true;
        this.warningModalSession.show();
        this.curSessionAction = {
            index: i,
            sessionId: sid
        };
    }

    doNextSession() {
        this.warningModalSession.hide();
        if (this.isDeleteSession) {
            this.deleteTeacherClassSession(this.curSessionAction.index, this.curSessionAction.sessionId);
        }
        else {
            this.completeTeacherClassSession(this.curSessionAction.index, this.curSessionAction.sessionId);
        }
    }

    deleteTeacherClassSession(index, sid) {
        Utils.showSpinner(true);

        let x = {
            id: sid,
            modifiedBy: this.curUser.id
        };

        this.proTeacher.deleteTeacherClassSession(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingSessions.splice(index, 1);
                this.editingClass= rsp.data;
                this.showToastSuccess("Bạn đã xóa buổi học thành công !");
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

    completeTeacherClassSession(index, sid) {
        Utils.showSpinner(true);

        let x = {
            id: sid,
            modifiedBy: this.curUser.id
        };

        this.proTeacher.completeTeacherClassSession(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingSessions[index] = rsp.data;
                this.showToastSuccess("Bạn đã cập nhật buổi học hoàn tất thành công !");
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

    isValidTime(str) {
        return /^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$/.test(str);
    }

}

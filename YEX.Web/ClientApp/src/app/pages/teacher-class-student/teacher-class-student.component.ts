import { Component, ViewChild, OnInit } from '@angular/core';
import { ModalDirective, BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { Utils, Token } from '../../utilities';
import { TeacherProvider, ExcelProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';
import * as XLSX from 'xlsx';
import * as jspdf from 'jspdf';
import html2canvas from 'html2canvas';
type AOA = any[][];

@Component({
    selector: 'app-teacher-class-student',
    templateUrl: './teacher-class-student.component.html',
    styleUrls: ['./teacher-class-student.component.css']
})
export class TeacherClassStudentComponent implements OnInit {
    modalRef: BsModalRef;
    confirmContent: any = {
        msg: '',
        action: ''
    };
    @ViewChild('socreModal', { static: true }) public socreModal: ModalDirective;
    @ViewChild('reportModal', { static: true }) public reportModal: ModalDirective;
    @ViewChild('uploadModal', { static: true }) public uploadModal: ModalDirective;
    @ViewChild('editModal', { static: true }) public editModal: ModalDirective;
    @ViewChild('createModal', { static: true }) public createModal: ModalDirective;
    @ViewChild('confirmModal', { static: false }) public confirmModal: ModalDirective;
    clickSearch: any = false;
    keyword: string = "";
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
    students: any = {
        data: [],
        totalRecords: 0,
        page: 0,
        size: 5,
        totalPages: 0,
    };
    editStudent: any = {
        classStudent: {
            id: 0,
            classId: 0,
            studentId: 0,
            studentRole: "",
            finalScore: null,
            finalResult: null,
            note: null,
            status: 1,
            createdBy: null,
            createdOn: null,
            modifiedBy: null,
            modifiedOn: null
        },
        student: {
            id: 0,
            officialStudentId: "",
            userId: 0,
            birthday: "",
            gender: false,
            studentType: "",
            class: "",
            courseName: "",
            note: "",
            schoolId: 0,
            status: 1,
            createdBy: null,
            createdOn: null,
            modifiedBy: null,
            modifiedOn: null
        },
        user: {
            id: 0,
            userName: "",
            firstName: "",
            lastName: "",
            email: "",
            phone: "",
            address: "",
            avatar: "",
            status: 1,
            createdBy: null,
            createdOn: null,
            modifiedBy: null,
            modifiedOn: null
        }
    };
    editStudentOld: any = {
        classStudent: null,
        student: null,
        user: null
    };
    newStudent: any = {};
    schoolName: string = "";
    editingItem: any = {};
    errE: any = {
        mssv: '',
        username: '',
        email: ''
    };
    errC: any = {
        mssv: '',
        username: '',
        email: ''
    };
    foundStudent: any = {
        student: null,
        user: null
    };
    ////
    studentScore: any = [];
    result: any = {
        totPer: 0,
        avgScore: 0.0,
        isFull: false
    };
    checkUploadMessage: string = '';
    listStudentUpload: any = [];
    deleteItem: any = {};
    // report
    scoreConfigStr: any = '';
    selScore: any = null;
    queryScore: boolean = false;
    rptSC: any = [];
    rpt: any = {
        totalStudent: 0,
        notScored: 0,
        zeroFiveScored: 0,
        fiveSevenScored: 0,
        sevenEightScored: 0,
        eightNineScored: 0,
        nineTenScored: 0,
        maxScored: 0,
        minScored: 0,
        avgScored: 0,
        passed: 0,
        unpassed: 0,
        pieChart: {
            title: 'Browser market shares at a specific website, 2014',
            type: 'PieChart',
            data: [
                ['Firefox', 45.0],
                ['IE', 26.8],
                ['Chrome', 12.8],
                ['Safari', 8.5],
                ['Opera', 6.2],
                ['Others', 0.7]
            ],
            columnNames: ['Browser', 'Percentage'],
            options: null,
        },
        histChart: {
            title: 'Students height, in cm',
            type: 'Histogram',
            data: [
                ["1", 80], ["2", 55], ["3", 68], ["4", 80], ["5", 54],
                ["6", 70], ["7", 85], ["8", 78], ["9", 70], ["10", 58],
                ["11", 90], ["12", 65], ["13", 88], ["14", 82], ["15", 65],
                ["16", 86], ["17", 45], ["18", 62], ["19", 84], ["20", 75],
                ["21", 82], ["22", 75], ["23", 58], ["24", 70], ["25", 85]
            ],
            columnNames: ["Student Roll No", "height"],
            options: {
                legend: { position: 'none' },
                colors: ['green'],
                hAxis: {
                    title: 'Điểm số'
                },
                vAxis: {
                    title: 'SL SV'
                }
            },
            width: '100%',
            height: 'auto'
        }
    };

    constructor(
        private proTeacher: TeacherProvider,
        private toastr: ToastrService,
        private modalService: BsModalService,
        private excel: ExcelProvider,
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
        this.schoolName = this.curClass.schoolName;
        //this.getTeacherClassStudent(1);
    }

    unSelectClass() {
        this.show = false;
        this.selectStyleBtn = {};
    }

    ////// start load student
    getTeacherClassStudent(cPage) {
        this.clickSearch = true;
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.classId,
            keyword: this.keyword,
            page: cPage,
            size: this.size
        };

        this.proTeacher.getTeacherClassStudent(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.students = rsp.data;
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
        this.getTeacherClassStudent(event.page);
    }

    dateChanged(eventDate: string): Date | null {
        return !!eventDate ? new Date(eventDate) : null;
    }

    getSTT(i) {
        var page = this.students.page;
        var stt = (page - 1) * this.size;
        stt = stt + i + 1;
        return stt;
    }

    deleteStudent(i, csid) {
        var s = this.students.data[i];
        this.deleteItem = {
            studentId: s.studentId,
            index: i,
            fullname: s.fullname
        };
        var str = "Bạn có chắc chắn xóa sinh viên [" + s.fullname + "] khỏi lớp này?";
        this.openConfirmModal(str, "delete-student");
    }

    openEditModal(i) {
        this.errE = {
            mssv: '',
            username: '',
            email: ''
        };
        this.editingItem = this.students.data[i];
        this.editingItem.index = i;
        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.editModal.config = config;
        this.getTeacherClassStudentInfo();
        this.editModal.show();
    }

    getTeacherClassStudentInfo() {
        Utils.showSpinner(true);

        let x = {
            id: this.editingItem.id
        };

        this.proTeacher.getTeacherClassStudentInfo(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editStudent = rsp.data;
                var data = rsp.data;
                this.editStudentOld = JSON.parse(JSON.stringify(data));
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

    checkMSSVEdit() {
        var newMSSV = this.editStudent.student.officialStudentId;
        var oldMSSV = this.editStudentOld.student.officialStudentId;
        //console.log(newMSSV,oldMSSV);
        var chk = this.checkValidMSSV(newMSSV);
        //console.log(chk);
        if (chk == false) {
            this.errE.mssv = "MSSV không hợp lệ !";
        }
        else {
            if (newMSSV != oldMSSV) {
                this.checkOfficialStudentId(newMSSV, true);
            }
            else {
                this.errE.mssv = "";
            }
        }
    }

    checkMSSVCreate() {
        var newMSSV = this.newStudent.student.officialStudentId;
        //console.log(newMSSV,oldMSSV);
        var chk = this.checkValidMSSV(newMSSV);
        //console.log(chk);
        if (chk == false) {
            this.errE.mssv = "MSSV không hợp lệ !";
        }
        else {
            this.checkOfficialStudentId(newMSSV, false);
        }
    }

    refreshFoundStudent() {
        this.foundStudent.student = null;
        this.foundStudent.user = null;
        this.newStudent.student = {
            officialStudentId: "",
            userId: 0,
            birthday: null,
            gender: false,
            studentType: "",
            class: "",
            courseName: "",
            note: "",
            schoolId: this.curClass.schoolId,
            status: 1,
            createdBy: this.curUser.id
        };
        this.newStudent.user = {
            userName: "",
            firstName: "",
            lastName: "",
            email: "",
            phone: "",
            address: "",
            avatar: "assets/img/avatars/ava1.png",
            status: 1,
            createdBy: this.curUser.id
        };
    }

    checkOfficialStudentId(osId, isEdit) {
        Utils.showSpinner(true);

        let x = {
            officialStudentId: osId,
            schoolId: this.curClass.schoolId,
            classId: this.curClass.classId
        };

        this.proTeacher.checkOfficialStudentId(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                var res = rsp.data.checkResult;
                if (isEdit) {
                    if (res == "OK") {
                        this.errE.mssv = "";
                    }
                    else if (res == "Existed-not-in-Classs") {
                        this.errE.mssv = "Tìm thấy MSSV này trong hệ thống, bạn có không thể chỉnh sửa, hãy thêm mới !";
                        this.foundStudent.student = rsp.data.student;
                        this.foundStudent.user = rsp.data.user;
                    }
                    else if (res == "Existed-in-Classs") {
                        this.errE.mssv = "Bạn không thể thêm MSSV này, vì trong lóp đã có !!";
                    }
                }
                else {
                    if (res == "OK") {
                        this.errC.mssv = "";
                    }
                    else if (res == "Existed-not-in-Classs") {
                        this.foundStudent.student = rsp.data.student;
                        this.foundStudent.user = rsp.data.user;
                        this.openConfirmModal("Tìm thấy MSSV này trong hệ thống, bạn có muốn lấy thông tin này lên?", "foundStudent-Create");
                    }
                    else if (res == "Existed-in-Classs") {
                        this.errC.mssv = "Bạn không thể thêm MSSV này, vì trong lóp đã có !!";
                    }
                }

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

    checkEmailEdit() {
        var newEmail = this.editStudent.user.email;
        var oldEmail = this.editStudentOld.user.email;
        //console.log(newMSSV,oldMSSV);
        var chk = this.checkValidEmail(newEmail);
        //console.log(chk);
        if (chk == false) {
            this.errE.email = "MSSV không hợp lệ !";
        }
        else {
            if (newEmail != oldEmail) {
                this.checkEmailExisted(newEmail, true);
            }
            else {
                this.errE.email = "";
            }
        }
    }

    checkEmailCreate() {
        var newEmail = this.newStudent.user.email;
        //console.log(newMSSV,oldMSSV);
        var chk = this.checkValidEmail(newEmail);
        //console.log(chk);
        if (chk == false) {
            this.errE.email = "MSSV không hợp lệ !";
        }
        else {
            this.checkEmailExisted(newEmail, false);
        }
    }

    checkEmailExisted(email, isEdit) {
        Utils.showSpinner(true);

        let x = {
            email: email,
        };

        this.proTeacher.checkEmailExisted(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                var res = rsp.data;
                if (isEdit) {
                    if (res == "OK") {
                        this.errE.email = "";
                    }
                    else if (res == "Existed-Email") {
                        this.errE.email = "Email này đã tồn tại trong hệ thống, bạn hãy check lại !!";
                    }
                }
                else {
                    if (res == "OK") {
                        this.errC.email = "";
                    }
                    else if (res == "Existed-Email") {
                        this.errC.email = "Email này đã tồn tại trong hệ thống, bạn hãy check lại !!";
                    }
                }
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

    openConfirmModal(msg, action) {
        //let confirmModal: TemplateRef<any>;
        this.confirmContent.msg = msg;
        this.confirmContent.action = action;
        this.modalRef = this.modalService.show(this.confirmModal, { class: 'second' });
    }

    confirm(): void {
        //this.message = 'Confirmed!';
        if (this.confirmContent.action == "foundStudent-Create") {
            this.newStudent.student = this.foundStudent.student;
            this.newStudent.user = this.foundStudent.user;
        }
        else if (this.confirmContent.action == "calculate-score") {
            this.calculateStudentScoreNext();
        }
        else if (this.confirmContent.action == "activate-account") {
            this.activateStudentAccountOfClass();
        }
        else if (this.confirmContent.action == "delete-student") {
            this.deleteStudentOfClass();
        }
        this.modalRef.hide();
        this.modalRef = null;
    }

    activateStudentAccountOfClass() {
        Utils.showSpinner(true);
        let x = {
            classId: this.curClass.classId,
        };

        this.proTeacher.activateStudentAccountOfClass(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                if (rsp.data.sentEmails != null && rsp.data.sentEmails.message == "") {
                    var str = '<p class="small">Bạn đã gửi mail thành công !';
                    for (var i = 0; i < rsp.data.activatedAccounts.length; i++) {
                        var s = rsp.data.activatedAccounts[i];
                        str = str + '<br/> ' + s.lastName + ' ' + s.firstName + ' : ' + s.email;
                    }
                    str = str + '</p>';
                    this.showToastSuccess(str);
                }
                else {
                    this.showToastError(rsp.data.sentEmails.message);
                }
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

    testSendEmail() {
        Utils.showSpinner(true);
        let x = {
            classId: this.curClass.classId,
        };

        this.proTeacher.testSendEmail(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                if (rsp.data.sentEmails != null && rsp.data.sentEmails.message == "") {
                    var str = '<p class="small">Bạn đã gửi mail thành công !';
                    for (var i = 0; i < rsp.data.activatedAccounts.length; i++) {
                        var s = rsp.data.activatedAccounts[i];
                        str = str + '<br/> ' + s.lastName + ' ' + s.firstName + ' : ' + s.email;
                    }
                    str = str + '</p>';
                    this.showToastSuccess(str);
                }
                else {
                    this.showToastError(rsp.data.sentEmails.message);
                }
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

    calculateStudentScoreNext() {
        Utils.showSpinner(true);
        let x = {
            classId: this.curClass.classId,
        };

        this.proTeacher.calculateStudentScore(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.showToastSuccess("Bạn đã cập nhật tính toán điểm cho sinh viên của lớp thành công !");
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

    deleteStudentOfClass() {
        Utils.showSpinner(true);

        var index = this.deleteItem.index;
        var fullname = this.deleteItem.fullname;
        let x = {
            classId: this.curClass.classId,
            studentId: this.deleteItem.studentId
        };

        this.proTeacher.deleteStudentOfClass(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.students.data.splice(index, 1);
                var totalRecords = this.students.totalRecords;
                this.students.totalRecords = totalRecords - 1;
                this.showToastSuccess("Bạn đã xóa sinh viên [" + fullname + "] thành công !");
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

    decline() {
        if (this.confirmContent.action == "foundStudent-Create") {
            this.errC.mssv == "MSSV tìm thấy trong hệ thống, và bạn chưa load data tương thích lên !";
        }
        this.modalRef.hide();
        this.modalRef = null;
    }

    saveStudentInfo() {
        if (this.checkSameStudentInfo()) {
            this.showToastError("Không có thay đổi để cập nhật !");
        }
        else {
            if (this.errC.mssv != "") {
                this.showToastError(this.errC.mssv);
            }
            else if (this.errC.email != "") {
                this.showToastError(this.errC.mssv);
            }
            else {
                //console.log("OK-to-save");
                this.saveTeacherClassStudentInfo();
            }
        }
    }

    saveTeacherClassStudentInfo() {
        Utils.showSpinner(true);

        let x = {
            classStudent: this.editStudent.classStudent,
            student: this.editStudent.student,
            user: this.editStudent.user,
            userId: this.curUser.id
        };

        this.proTeacher.saveTeacherClassStudentInfo(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editStudent = rsp.data;
                var data = rsp.data;
                this.editStudentOld = JSON.parse(JSON.stringify(data));
                this.editingItem.studentRole = rsp.data.classStudent.studentRole;
                this.editingItem.officialStudentId = rsp.data.student.officialStudentId;
                this.editingItem.birthday = rsp.data.student.birthday;
                this.editingItem.gender = rsp.data.student.gender;
                this.editingItem.className = rsp.data.student.class;
                this.editingItem.courseName = rsp.data.student.courseName;
                this.editingItem.phone = rsp.data.user.phone;
                this.editingItem.email = rsp.data.user.email;
                this.editingItem.address = rsp.data.user.address;
                this.editingItem.fullname = rsp.data.user.lastName + " " + rsp.data.user.firstName;
                this.showToastSuccess("Bạn đã cập nhật thành công thông tin Sinh viên [" + this.editingItem.fullname + "]!");
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

    checkSameStudentInfo() {
        if (this.editStudent.classStudent.studentRole != this.editStudentOld.classStudent.studentRole)
            return false;
        if (this.editStudent.student.officialStudentId != this.editStudentOld.student.officialStudentId)
            return false;
        if (this.editStudent.student.birthday != this.editStudentOld.student.birthday)
            return false;
        if (this.editStudent.student.gender != this.editStudentOld.student.gender)
            return false;
        if (this.editStudent.student.studentType != this.editStudentOld.student.studentType)
            return false;
        if (this.editStudent.student.class != this.editStudentOld.student.class)
            return false;
        if (this.editStudent.student.courseName != this.editStudentOld.student.courseName)
            return false;
        if (this.editStudent.student.note != this.editStudentOld.student.note)
            return false;
        if (this.editStudent.user.firstName != this.editStudentOld.user.firstName)
            return false;
        if (this.editStudent.user.lastName != this.editStudentOld.user.lastName)
            return false;
        if (this.editStudent.user.email != this.editStudentOld.user.email)
            return false;
        if (this.editStudent.user.phone != this.editStudentOld.user.phone)
            return false;
        if (this.editStudent.user.address != this.editStudentOld.user.address)
            return false;
        return true;
    }

    openCreateModal() {
        this.refreshFoundStudent();
        this.errC = {
            mssv: '',
            username: '',
            email: ''
        };
        this.editingItem = {
            index: null,
            id: null,
            studentId: 0,
            classId: 0,
            status: 1,
            note: null,
            studentRole: "",
            finalScore: null,
            createdBy: 0,
            createdOn: null,
            officialStudentId: "",
            userId: null,
            birthday: null,
            gender: null,
            schoolId: 0,
            className: "",
            courseName: "",
            schoolCode: "",
            schoolName: "",
            phone: "",
            email: "",
            userName: "",
            avatar: "",
            address: "",
            fullname: "",
        };
        this.newStudent = {
            classStudent: {
                classId: this.curClass.classId,
                studentId: 0,
                studentRole: "",
                note: null,
                status: 1,
                createdBy: this.curUser.id
            },
            student: {
                officialStudentId: "",
                userId: 0,
                birthday: null,
                gender: false,
                studentType: "",
                class: "",
                courseName: "",
                note: "",
                schoolId: this.curClass.schoolId,
                status: 1,
                createdBy: this.curUser.id
            },
            user: {
                userName: "",
                firstName: "",
                lastName: "",
                email: "",
                phone: "",
                address: "",
                avatar: "assets/img/avatars/ava1.png",
                status: 1,
                createdBy: this.curUser.id
            }
        };
        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.createModal.config = config;
        this.createModal.show();

    }

    ///// 
    openUploadModal() {
        this.checkUploadMessage = "";
        this.listStudentUpload = [];
        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.uploadModal.config = config;
        this.uploadModal.show();
    }

    exportAsXLSX(): void {
        var data = [];
        for (var i = 0; i < this.students.data.length; i++) {
            var item = this.students.data[i];
            var student = {
                classId: item.classId,
                studentRole: item.studentRole,
                officialStudentId: item.officialStudentId,
                birthday: item.birthday,
                gender: item.gender,
                studentType: item.studentType,
                className: item.className,
                courseName: item.courseName,
                note: item.note,
                schoolId: item.schoolId,
                lastName: item.lastName,
                firstName: item.firstName,
                email: item.email,
                phone: item.phone,
                address: item.address,
            };
            data.push(student);
        }
        var tit = "DSSV_Lop_" + this.curClass.classId;
        this.excel.exportAsExcelFile(data, tit);
    }

    onFileChange(evt: any) {
        /* wire up file reader */
        const target: DataTransfer = <DataTransfer>(evt.target);
        if (target.files.length !== 1) throw new Error('Cannot use multiple files');
        const reader: FileReader = new FileReader();
        reader.onload = (e: any) => {
            /* read workbook */
            const bstr: string = e.target.result;
            const wb: XLSX.WorkBook = XLSX.read(bstr, { type: 'binary' });

            /* grab first sheet */
            const wsname: string = wb.SheetNames[0];
            const ws: XLSX.WorkSheet = wb.Sheets[wsname];

            /* save data */
            var data = <AOA>(XLSX.utils.sheet_to_json(ws, { header: 1 }));
            //console.log(data);
            this.updateByExcel(data);
        };
        reader.readAsBinaryString(target.files[0]);
        evt.srcElement.value = null;
    }

    updateByExcel(data: any) {
        //console.log(data);
        var str = "";
        var lsStudent = [];
        if (data != null && data.length > 1) {
            var head = data[0];
            if (head[0] == "classId" && head[1] == "studentRole" && head[2] == "officialStudentId"
                && head[3] == "birthday" && head[4] == "gender" && head[5] == "studentType"
                && head[6] == "className" && head[7] == "courseName" && head[8] == "note"
                && head[9] == "schoolId" && head[10] == "lastName" && head[11] == "firstName"
                && head[12] == "email" && head[13] == "phone" && head[14] == "address") {
                for (var i = 1; i < data.length; i++) {
                    var s = data[i];
                    var chk = true;

                    var student = {
                        classId: parseInt(s[0]),
                        studentRole: s[1],
                        officialStudentId: s[2],
                        birthday: (s[3] != "" && s[3] != null && (Date.parse(s[3]) != NaN)) ? new Date(s[3]) : null,
                        gender: (s[4] == "FALSE" || s[4] == "false" || s[4] == "False" || s[4] == false) ? false : true,
                        studentType: s[5],
                        className: s[6],
                        courseName: s[7],
                        note: s[8],
                        schoolId: parseInt(s[9]),
                        lastName: s[10],
                        firstName: s[11],
                        email: s[12],
                        phone: s[13],
                        address: s[14],
                    };
                    //console.log(student);
                    if (student.classId == NaN) {
                        str = str + '<br/> Dòng [' + i + '] <strong>mã lớp</strong>  không hợp lệ, phải là số nguyên dương!';
                        chk = false;
                    }
                    if (student.schoolId == NaN) {
                        str = str + '<br/> Dòng [' + i + '] <strong>mã trường</strong> không hợp lệ, phải là số nguyên dương!';
                        chk = false;
                    }
                    if (student.studentType != 'Grad-Student' && student.studentType !== 'Under-Student') {
                        str = str + '<br/> Dòng [' + i + '] <strong>studentType</strong> không hợp lệ, chỉ được 1 trong 2 [Grad-Student], [Under-Student] !';
                        chk = false;
                    }
                    if (student.studentRole !== 'Thành viên' && student.studentRole !== 'Lớp trưởng' && student.studentRole != "Lớp phó") {
                        str = str + '<br/> Dòng [' + i + '] <strong>studentRole</strong> không hợp lệ, chỉ được 1 trong 3 [Thành viên], [Lớp trưởng], [Lớp phó] !';
                        chk = false;
                    }
                    if (this.checkValidEmail(student.email) == false) {
                        str = str + '<br/> Dòng [' + i + '] <strong>email</strong> không hợp lệ !';
                        chk = false;
                    }
                    if (this.checkValidMSSV(student.officialStudentId) == false) {
                        str = str + '<br/> Dòng [' + i + '] <strong>MSSV</strong> không hợp lệ !';
                        chk = false;
                    }
                    //student.checkStr = str;
                    if (chk) {
                        lsStudent.push(student);
                    }
                }
                if (lsStudent.length == 0) {
                    this.showToastError("File excel dữ liệu không  có sinh viên nào có dữ liệu chính xác !");
                }
                else {
                    this.showToastSuccess("Kiểm tra thấy có [" + lsStudent.length + "] sinh viên  dữ liệu hợp lệ!");
                }
            }
            else {
                this.showToastError("File excel không đúng định dạng, vui lòng tải file Template !");
            }
        }
        else {
            this.showToastError("File excel không có data !");
        }
        if (str != "")
            this.checkUploadMessage = str;
        else
            this.checkUploadMessage = "";
        //console.log(lsStudent);
        if (lsStudent.length > 0)
            this.listStudentUpload = lsStudent;
        else
            this.listStudentUpload = [];
    }

    uploadStudentList() {
        if (this.listStudentUpload.length > 0) {
            Utils.showSpinner(true);

            let x = this.listStudentUpload;

            this.proTeacher.saveClassStudentInfoByUpload(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    //console.log(rsp.data);
                    if (rsp.data.checkMsg == "OK") {
                        var n = rsp.data.totalStudent;
                        this.showToastSuccess("Cập nhật thành công cho [" + n + "] sinh viên !");
                        this.listStudentUpload = [];
                    }
                    else if (rsp.data.checkMsg == "Not-OK") {
                        this.showToastError("Dữ liệu không chính xác, vui lòng kiểm tra lại !");
                    }
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
            this.showToastError("Không có dữ liệu để cập nhật !!");
        }
    }

    downloadStudentList() {
        Utils.showSpinner(true);
        let x = {
            classId: this.curClass.classId
        };
        this.proTeacher.downloadClassStudentListFullData(x).subscribe(data => {
            saveAs(data, 'Classs_Student_' + new Date().getTime() + '.xls');
            Utils.showSpinner(false);
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    openScoreModal(i) {
        this.editingItem = this.students.data[i];
        this.editingItem.index = i;
        this.getStudentScoreList();
    }

    getStudentScoreList() {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.classId,
            studentId: this.editingItem.studentId
        };

        this.proTeacher.getStudentScoreList(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.studentScore = rsp.data;
                var n = 0;
                var tempScoreTotal = 0;
                for (var i = 0; i < rsp.data.length; i++) {
                    var item = rsp.data[i];
                    this.result.totPer = this.result.totPer + item.percentage;

                    if (item.score != null) {
                        tempScoreTotal += item.score * item.percentage;
                        n++;
                    }
                }
                if (n == rsp.data.length) {
                    this.result.avgScore = tempScoreTotal / this.result.totPer;
                    this.result.isFull = true;
                }
                else
                    this.result.isFull = false;
                ////////////////////
                let config: any = {
                    backdrop: true,
                    ignoreBackdropClick: true
                };
                this.socreModal.config = config;
                this.socreModal.show();
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

    createStudentForClass() {
        var str = this.checkFullForCreate();
        if (str == "") {
            if (this.errC.mssv != "") {
                this.showToastError(this.errC.mssv);
            }
            else if (this.errC.email != "") {
                this.showToastError(this.errC.email);
            }
            else {
                //console.log("OK-to-Create");
                this.createTeacherClassStudentInfo();
            }
        }
        else {
            this.showToastError(str);
        }
    }

    createTeacherClassStudentInfo() {
        Utils.showSpinner(true);

        let x = {
            classStudent: this.newStudent.classStudent,
            student: this.newStudent.student,
            user: this.newStudent.user
        };

        this.proTeacher.createTeacherClassStudentInfo(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.showToastSuccess("Bạn đã thêm mới thành công thông tin Sinh viên !");
                this.createModal.hide();
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

    checkFullForCreate() {
        var str = '';
        if (this.newStudent.classStudent.studentRole == null || this.newStudent.classStudent.studentRole.trim() == "")
            str = str + "Vui lòng chọn [Vai trò].<br/>";
        if (!this.checkValidMSSV(this.newStudent.student.officialStudentId))
            str = str + "Vui lòng nhập liệu cho [MSSV / MSHV].<br/>";
        if (this.newStudent.student.birthday == null)
            str = str + "Vui lòng kiểm tra [Ngày sinh ].<br/>";
        if (this.newStudent.student.gender == null)
            str = str + "Vui lòng chọn [Giới tính] ! <br/>";
        if (this.newStudent.student.courseName.trim().length == 0)
            str = str + "Vui lòng nhập liệu cho [Khóa học] !<br/>";
        if (this.newStudent.user.lastName.trim().length == 0)
            str = str + "Vui lòng nhập liệu cho [Họ lót] !<br/>";
        if (this.newStudent.user.firstName.trim().length == 0)
            str = str + "Vui lòng nhập liệu cho [Tên] !<br/>";
        if (!this.checkValidEmail(this.newStudent.user.email))
            str = str + "[Email] không hợp lệ.<br/>";
        if (this.newStudent.user.phone.trim().length == 0)
            str = str + "Vui lòng nhập liệu cho [Số ĐT] .<br/>";
        if (this.newStudent.user.address.trim().length == 0)
            str = str + "Vui lòng nhập liệu cho [D0ịa chỉ liên lạc] .<br/>";
        return str;
    }
    ////// end load student

    ///// start tổng kết điểm
    calculateStudentScore() {
        this.openConfirmModal("Bạn có muốn tổng kết điểm cho sinh viên, tính toán lại điểm cho sinh viên của lớp?", "calculate-score");
    }
    ///// end tổng kết điểm

    ///// activate
    activateStudentAccount() {
        var str = "Bạn có muốn kích hoạt tài khoản người dùng cho sinh viên của lớp?";
        str = str + "<br/> <small>Các tài khoản nào chưa kích hoạt sẽ được kích hoạt, còn các tài khoản đang xài bình thường sẽ không ảnh hưởng.</small>";
        str = str + "<br/> <small>Các tài khoản sẽ được nhận email kích hoạt để đăng nhập vào hệ thống !</small>";
        this.openConfirmModal(str, "activate-account");
    }
    ///// end activate

    /// Start  Report
    getScoreConfigForClass() {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.classId
        };

        this.proTeacher.getScoreConfigForClass(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.rptSC = rsp.data;
                let config: any = {
                    backdrop: true,
                    ignoreBackdropClick: true
                };
                this.reportModal.config = config;
                this.reportModal.show();
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

    openReportModal() {
        this.getScoreConfigForClass();
    }

    queryScoreReport() {
        //console.log(this.selScore);
        if (this.selScore == null || this.selScore == "null" || this.selScore == "") {
            this.queryScore = false;
            this.showToastError("Vui lòng chọn điểm để xem báo cáo !");
        }
        else {
            this.queryScore = true;
            this.showSCStr();
            this.getReportScoreConfigForClass();
        }
    }

    showSCStr() {
        var scId = parseInt(this.selScore);
        if (scId == 0) {
            this.scoreConfigStr = "Điểm tổng kết môn học";
        }
        else {
            var arr = this.rptSC.filter(a => a.id == scId);
            var sc = arr[0];
            this.scoreConfigStr = this.getScoreType(sc.scoreType) + " - " + sc.percentage + "% - " + sc.description;
        }
    }

    resetScoreReport() {
        this.queryScore = false;
    }

    getReportScoreConfigForClass() {
        let x = {
            classId: this.curClass.classId,
            scoreConfigId: parseInt(this.selScore)
        };
        //console.log(x);

        Utils.showSpinner(true);
        this.proTeacher.getReportScoreConfigForClass(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                //this.rptSC = rsp.data;
                this.rpt = {
                    totalStudent: rsp.data.totalStudent,
                    notScored: rsp.data.notScored,
                    zeroFiveScored: rsp.data.zeroFiveScored,
                    fiveSevenScored: rsp.data.fiveSevenScored,
                    sevenEightScored: rsp.data.sevenEightScored,
                    eightNineScored: rsp.data.eightNineScored,
                    nineTenScored: rsp.data.nineTenScored,
                    maxScored: rsp.data.maxScored,
                    minScored: rsp.data.minScored,
                    avgScored: rsp.data.avgScored,
                    passed: rsp.data.passed,
                    unpassed: rsp.data.unpassed,
                    pieChart: {
                        title: 'Biểu đồ tỷ lệ phân loại điểm số',
                        type: 'PieChart',
                        data: [
                            ['Không tham gia thi / làm bài/ nộp bài', rsp.data.notScored],
                            ['Từ 0 điểm --> nhỏ hơn 5 điểm', rsp.data.zeroFiveScored],
                            ['Từ 5 điểm --> nhỏ hơn 7 điểm', rsp.data.fiveSevenScored],
                            ['Từ 7 điểm --> nhỏ hơn 8 điểm', rsp.data.sevenEightScored],
                            ['Từ 8 điểm --> nhỏ hơn 9 điểm', rsp.data.eightNineScored],
                            ['Từ 9 điểm --> 10 điểm', rsp.data.nineTenScored]
                        ],
                        columnNames: ['Browser', 'Percentage'],
                        options: null,
                    },
                    histChart: {
                        title: 'Biểu đồ phân bố điểm số',
                        type: 'Histogram',
                        data: this.getDataForHistChart(rsp.data.listStudent),
                        columnNames: ["Số lượng SV", "Điểm"],
                        options: {
                            legend: { position: 'none' },
                            colors: ['green'],
                            hAxis: {
                                title: 'Điểm số'
                            },
                            vAxis: {
                                title: 'số lượng SV'
                            }
                        },
                        width: '100%',
                        height: 'auto'
                    }
                }
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
    
    getDataForHistChart(lst)
    {
        var arr = [];
        for(var i = 0; i< lst.length; i++)
        {
            var s = lst[i];
            var item =[s.officialStudentId + " - " + s.fullname,s.score];
            arr.push(item);
        }
        return arr;
    }

    exportAsPDF() {
        let data = document.getElementById('MyDiv');
        html2canvas(data).then(canvas => {
            const contentDataURL = canvas.toDataURL('image/png')
            //let pdf = new jspdf('l', 'cm', 'a4'); //Generates PDF in landscape mode
            let pdf = new jspdf('p', 'cm', 'a4');  //Generates PDF in portrait mode
            pdf.addImage(contentDataURL, 'PNG', 0, 0, 21.0, 29.7);
            pdf.save('Filename.pdf');
        });
    }

    captureScreen() {
        const data = document.getElementById('MyDiv');
        html2canvas(data).then(canvas => {
            const imgWidth = 208;
            const pageHeight = 295;
            const imgHeight = canvas.height * imgWidth / canvas.width;
            const heightLeft = imgHeight;
            const contentDataURL = canvas.toDataURL('image/png');
            const pdf = new jspdf('p', 'mm', 'a3');
            const position = 0;
            pdf.addImage(contentDataURL, 'PNG', 0, position, imgWidth, imgHeight);
            pdf.save('invoice.pdf');
        });
    }

    getPercentage(per) {
        var tot = this.rpt.totalStudent;
        var num = (per * 100) / tot;
        return (num.toFixed(2) + "%");
    }

    getScoreType(type) {
        if (type == "QuaTrinh")
            return "Điểm quá trình";
        else if (type == "CuoiKy")
            return "Điểm cuối kỳ";
        else
            return "";
    }
    /// End  Report
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

    checkValidMSSV(str) {
        var regex = /^[A-Za-z0-9]+$/;
        if (regex.test(str)) {
            return true;
        } else {
            return false;
        }
    }

    checkValidEmail(email) {
        var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (regex.test(email)) {
            return true;
        } else {
            return false;
        }
    }
}

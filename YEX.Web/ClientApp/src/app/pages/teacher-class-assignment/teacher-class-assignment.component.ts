import { Component, ViewChild, OnInit } from '@angular/core';
import { HttpHeaders } from '@angular/common/http';
import { ModalDirective, BsModalService, BsModalRef } from 'ngx-bootstrap/modal';
import { Utils, Token } from '../../utilities';
import { TeacherProvider, FileProvider, ExcelProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    selector: 'app-teacher-class-assignment',
    templateUrl: './teacher-class-assignment.component.html',
    styleUrls: ['./teacher-class-assignment.component.css']
})
export class TeacherClassAssignmentComponent implements OnInit {
    // Confirm Modal
    modalRef: BsModalRef;
    confirmContent: any = {
        msg: '',
        isDelete: false,
        isComplete: false,
        index: 0,
        assignId: 0,
        stt: 1
    };
    @ViewChild('examModal', { static: false }) public examModal: ModalDirective;
    @ViewChild('studentModal', { static: false }) public studentModal: ModalDirective;
    @ViewChild('assignmentModal', { static: false }) public assignmentModal: ModalDirective;
    @ViewChild('confirmModal', { static: false }) public confirmModal: ModalDirective;
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
    assignments1: any = []; // submit
    assignments2: any = []; // online
    submitTypes: any = [];
    students: any = [];
    editingAssignment: any = null;
    action: any = {
        isEdit: false,
        stt: 1
    };
    workGroup: any = "0";
    curAssign: any = {};
    studentGroup: any = [];
    studentGroupOld: any = [];
    exam: any = {};
    //examOld: any = {};
    examList: any = [];
    examIndex: any = "";
    selExam: any = null;    
    constructor(
        private router: Router,
        private proTeacher: TeacherProvider,
        private toastr: ToastrService,
        private proFile: FileProvider,
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
        this.getTeacherClassAssignment();
    }

    unSelectClass() {
        this.show = false;
        this.selectStyleBtn = {};
    }

    /////////////----start -----///////////////
    getTeacherClassAssignment() {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.classId,
            createdBy: this.curUser.id
        };

        this.proTeacher.getTeacherClassAssignment(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.assignments1 = rsp.data.normal;
                this.assignments2 = rsp.data.onlineTest;
                this.submitTypes = rsp.data.submitType;
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

    getSubmitTye(type) {
        var arr1 = this.submitTypes.filter(d => d.value == type);
        var item = arr1[0];
        return item.displayAs;
    }

    deleteAssignment(i, aid, stt) {
        this.confirmContent = {
            msg: '<span class="text-danger"> Bạn có chắc chắn xóa Bài tập id=[' + aid + '] ?</span>',
            isDelete: true,
            isComplete: false,
            index: i,
            assignId: aid,
            stt: stt
        };
        this.openConfirmModal();
    }

    openAssignmentModal(i, stt) {
        if (i == null) {
            this.action = {
                isEdit: false,
                stt: stt
            };
            this.editingAssignment = {
                index: null,
                id: 0,
                name: "",
                classId: this.curClass.classId,
                assignmentType: "",
                assignmentContent: "",
                assignmentUrl: null,
                groupNo: 1,
                dueDate: null,
                requireSubmit: true,
                submitType: "",
                createdBy: this.curUser.id,
                status: 1,
                modifiedOn: null,
                modifiedByName: '',
                createdByName: ''
            };
            this.workGroup = "0"
        }
        else {
            this.action = {
                isEdit: true,
                stt: stt
            };
            if (stt == 1) {
                var item = this.assignments1[i];
                this.editingAssignment = {
                    index: i,
                    id: item.id,
                    name: item.name,
                    classId: this.curClass.classId,
                    assignmentType: item.assignmentType,
                    assignmentContent: item.assignmentContent,
                    assignmentUrl: item.assignmentUrl,
                    groupNo: item.groupNo,
                    dueDate: item.dueDate,
                    requireSubmit: item.requireSubmit,
                    submitType: item.submitType,
                    createdBy: item.createdBy,
                    status: item.status,
                    createdOn: item.createdOn,
                    modifiedOn: item.modifiedOn,
                    modifiedByName: item.modifiedByName,
                    createdByName: item.createdByName
                };
                if (item.groupNo > 1)
                    this.workGroup = "1";
                else
                    this.workGroup = "0";
            }
            else {
                var item = this.assignments2[i];
                this.editingAssignment = {
                    index: i,
                    id: item.id,
                    name: item.name,
                    classId: this.curClass.classId,
                    assignmentType: item.assignmentType,
                    assignmentContent: item.assignmentContent,
                    assignmentUrl: item.assignmentUrl,
                    groupNo: item.groupNo,
                    dueDate: item.dueDate,
                    requireSubmit: item.requireSubmit,
                    submitType: item.submitType,
                    createdBy: item.createdBy,
                    status: item.status,
                    createdOn: item.createdOn,
                    modifiedOn: item.modifiedOn,
                    modifiedByName: item.modifiedByName,
                    createdByName: item.createdByName
                };
                if (item.groupNo > 1)
                    this.workGroup = "1";
                else
                    this.workGroup = "0";
            }
        }
        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.assignmentModal.config = config;
        this.assignmentModal.show();
        const d: HTMLInputElement = document.getElementById('assignmentFile') as HTMLInputElement;
        //console.log(d);
        if (d != null)
            d.value = null;
    }

    completeAssignment(i, aid, stt) {
        this.confirmContent = {
            msg: '<span class="text-warning"> Bạn có chắc chắn hoàn tất Bài tập id=[' + aid + '] ?</span>',
            isDelete: false,
            isComplete: true,
            index: i,
            assignId: aid,
            stt: stt
        };
        this.openConfirmModal();
    }

    downloadAssignment(i, aid, stt) {
        let item: any = {};
        if (stt == 1)
            item = this.assignments1[i];
        else
            item = this.assignments2[i];

        var dot = item.assignmentUrl.indexOf(".");
        var ext = item.assignmentUrl.substr(dot, item.assignmentUrl.length);
        //console.log(item.assignmentType +`_`+item.id+ext);
        this.proFile.download(item.assignmentUrl).subscribe(data => saveAs(data, item.assignmentType + `_` + item.id + ext));
    }

    dateChanged(eventDate: string): Date | null {
        return !!eventDate ? new Date(eventDate) : null;
    }

    groupChange(e) {
        var val = e.target.value;
        if (val == "1") {
            this.editingAssignment.groupNo = 2;
        }
        else {
            this.editingAssignment.groupNo = 1;
        }
    }

    SaveAssignment() {
        var str = this.checkFull();
        if (str == "") {
            if (this.checkSameAssign()) {
                this.showToastError("Không có thay đổi để cập nhật !!");
            }
            else {
                //console.log(this.editingAssignment);
                this.saveTeacherClassAssignment();
            }
        }
        else {
            this.showToastError(str);
        }
    }

    saveTeacherClassAssignment() {
        const formData = new FormData();
        let chkStr = "";
        if(this.action.stt==1)
        {
            const d: HTMLInputElement = document.getElementById('assignmentFile') as HTMLInputElement;
            if (d.files.length > 0) {
                if (d.files.length == 1) {
                    var file = d.files[0];
                    formData.append('files', file);
                }
                else
                    chkStr = "Bạn chỉ được upload 1 file duy nhất !!";
            }
        }
        this.editingAssignment.modifiedBy = this.curUser.id;
        formData.append('ClassAssignment', JSON.stringify(this.editingAssignment));

        // Headers
        let token = '';
        token = Token.getToken();
        let t = new HttpHeaders().set('Authorization', token);
        //t = t.append('Content-Type', 'multipart/form-data');

        if (chkStr == "") {
            Utils.showSpinner(true);
            this.proTeacher.saveTeacherClassAssignment(formData)
                .subscribe((rsp: any) => {
                    if (rsp.success) {
                        //console.log(rsp.data);
                        var index = this.editingAssignment.index;
                        this.editingAssignment.assignmentUrl = rsp.data.assignmentUrl;
                        this.editingAssignment.assignmentType = rsp.data.assignmentType;
                        this.editingAssignment.assignmentContent = rsp.data.assignmentContent;
                        this.editingAssignment.groupNo = rsp.data.groupNo;
                        this.editingAssignment.dueDate = rsp.data.dueDate;
                        this.editingAssignment.requireSubmit = rsp.data.requireSubmit;
                        this.editingAssignment.submitType = rsp.data.submitType;
                        this.editingAssignment.createdBy = rsp.data.createdBy;
                        this.editingAssignment.createdOn = rsp.data.createdOn;
                        this.editingAssignment.status = rsp.data.status;
                        this.editingAssignment.modifiedOn = rsp.data.modifiedOn;
                        this.editingAssignment.modifiedByName = rsp.data.modifiedByName;
                        this.editingAssignment.createdByName = rsp.data.createdByName;
                        if (this.action.stt == 1)
                            this.assignments1[index] = rsp.data;
                        else
                            this.assignments2[index] = rsp.data;
                        this.showToastSuccess("Đã cập nhật bài tập thành công !");
                        if(this.action.stt==1)
                        {
                            const d: HTMLInputElement = document.getElementById('assignmentFile') as HTMLInputElement;
                            if (d != null)
                                d.value = null;
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
            this.showToastError(chkStr);
        }
    }

    CreateAssignment() {
        if (this.action.stt == 1) {
            const d: HTMLInputElement = document.getElementById('assignmentFile') as HTMLInputElement;
            if (d.files.length == 0) {
                this.showToastError("Bạn chưa chọn File cần upload cho bài tập !");
            }
            else {
                var str = this.checkFull();
                if (str == "") {
                    //console.log(this.editingAssignment);
                    this.createTeacherClassAssignment();
                }
                else {
                    this.showToastError(str);
                }
            }
        }
        else {
            var str = this.checkFull();
            if (str == "") {
                //console.log(this.editingAssignment);
                this.createTeacherClassAssignment();
            }
            else {
                this.showToastError(str);
            }
        }
    }

    createTeacherClassAssignment() {
        const formData = new FormData();
        let chkStr = "";
        if(this.action.stt==1)
        {
            const d: HTMLInputElement = document.getElementById('assignmentFile') as HTMLInputElement;
            if (d.files.length > 0) {
                if (d.files.length == 1) {
                    var file = d.files[0];
                    formData.append('files', file);
                }
                else
                    chkStr = "Bạn chỉ được upload 1 file duy nhất !!";
            }
        }
        formData.append('ClassAssignment', JSON.stringify(this.editingAssignment));

        // Headers
        let token = '';
        token = Token.getToken();
        let t = new HttpHeaders().set('Authorization', token);
        //t = t.append('Content-Type', 'multipart/form-data');

        if (chkStr == "") {
            Utils.showSpinner(true);
            this.proTeacher.createTeacherClassAssignment(formData)
                .subscribe((rsp: any) => {
                    if (rsp.success) {
                        //console.log(rsp.data);
                        if (this.action.stt == 1) {
                            var index = this.assignments1.length;
                            var item = JSON.parse(JSON.stringify(rsp.data));
                            item.index = index;
                            this.editingAssignment = item;
                            this.assignments1.push(item);
                        }
                        else {
                            var index = this.assignments2.length;
                            var item = JSON.parse(JSON.stringify(rsp.data));
                            item.index = index;
                            this.editingAssignment = item;
                            this.assignments2.push(item);
                        }
                        this.action.isEdit = true;
                        if(this.action.stt==1)
                        {
                            const d: HTMLInputElement = document.getElementById('assignmentFile') as HTMLInputElement;
                            if (d != null)
                                d.value = null;
                        }
                        this.showToastSuccess("Đã thêm mới bài tập thành công !");
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

    checkSameAssign() {
        var arr1 = [];
        if (this.action.stt == 1)
            arr1 = this.assignments1.filter(d => d.id == this.editingAssignment.id);
        else
            arr1 = this.assignments2.filter(d => d.id == this.editingAssignment.id);
        var item = arr1[0];
        if (this.editingAssignment.classId != item.classId)
            return false;
        if (this.editingAssignment.assignmentType != item.assignmentType)
            return false;
        if (this.editingAssignment.assignmentContent != item.assignmentContent)
            return false;
        if (this.editingAssignment.assignmentUrl != item.assignmentUrl)
            return false;
        if (this.editingAssignment.groupNo != item.groupNo)
            return false;
        if (this.editingAssignment.dueDate != item.dueDate)
            return false;
        if (this.editingAssignment.requireSubmit != item.requireSubmit)
            return false;
        if (this.editingAssignment.submitType != item.submitType)
            return false;
        if(this.action.stt==1)
        {
            const d: HTMLInputElement = document.getElementById('assignmentFile') as HTMLInputElement;
            if (this.action.stt == 1 && d.files.length == 1)
                return false;
        }
        
        return true;
    }

    checkFull() {
        var str = "";
        if (this.editingAssignment.assignmentType == null || this.editingAssignment.assignmentType == "")
            str = str + "Bạn vui lòng chọn [Hình thức bài tập ]. <br/>";
        if (this.editingAssignment.name.trim() == "")
            str = str + "Bạn vui lòng nhập [Tên bài tập ]. <br/>";
        if (this.editingAssignment.assignmentContent.trim() == "")
            str = str + "Bạn vui lòng nhập [Nội dung bài tập ]. <br/>";
        if (this.editingAssignment.requireSubmit == null)
            str = str + "Bạn vui lòng chọn  [Yêu cầu nộp bài]. <br/>";
        if (this.editingAssignment.dueDate == null)
            str = str + "Bạn vui lòng chọn ngày [Hạn nộp bài]. <br/>";
        if (this.editingAssignment.submitType == null || this.editingAssignment.submitType == "")
            str = str + "Bạn vui lòng chọn [Cách nộp bài ]. <br/>";
        return str;
    }
    /////////////----End -----///////////////

    //// Confirm
    openConfirmModal() {
        //let confirmModal: TemplateRef<any>;
        this.modalRef = this.modalService.show(this.confirmModal, { class: 'modal-sm' });
    }

    confirm(): void {
        //this.message = 'Confirmed!';
        if (this.confirmContent.isDelete) {
            this.deleteTeacherClassAssignment();
        }
        else if (this.confirmContent.isComplete) {
            this.completeClassAssignment();
        }
        this.modalRef.hide();
    }

    deleteTeacherClassAssignment() {
        Utils.showSpinner(true);

        let x = {
            id: this.confirmContent.assignId,
            modifiedBy: this.curUser.id
        };

        this.proTeacher.deleteTeacherClassAssignment(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                var index = this.confirmContent.index;
                if (this.confirmContent.stt == 1)
                    this.assignments1.splice(index, 1);
                else
                    this.assignments2.splice(index, 1);
                this.showToastSuccess("Bạn đã xóa [Bài tập] thành công !");
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

    completeClassAssignment() {
        Utils.showSpinner(true);

        let x = {
            id: this.confirmContent.assignId,
            modifiedBy: this.curUser.id
        };

        this.proTeacher.completeClassAssignment(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                var index = this.confirmContent.index;
                if (this.confirmContent.stt == 1)
                    this.assignments1[index] = rsp.data;
                else
                    this.assignments2[index] = rsp.data;
                //this.checkScoredAssignment();
                this.showToastSuccess("Bạn đã hoàn tất [Bài tập] thành công,<br/> Bạn không thể chỉnh sửa nữa !");
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

    decline(): void {
        //this.message = 'Declined!';
        this.modalRef.hide();
    }
    ///// end confirm


    ///////////// Student Modal
    openStudentModal(i, aid, stt) {
        if (stt == 1)
            this.curAssign = this.assignments1[i];
        else
            this.curAssign = this.assignments2[i];
        this.getTeacherClassAssignmentStudentGroup();
        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.studentModal.config = config;
        this.studentModal.show();
    }

    getTeacherClassAssignmentStudentGroup() {
        Utils.showSpinner(true);

        let x = {
            classAssignmentId: this.curAssign.id,
        };

        this.proTeacher.getTeacherClassAssignmentStudentGroup(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.studentGroup = rsp.data;
                var data = rsp.data;
                this.studentGroupOld = JSON.parse(JSON.stringify(data));
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

    studentGroupChange(event: any, i) {
        var grp = event.target.value;
        var fGrp = parseFloat(grp);
        if (grp.trim() != "" && fGrp > 0 && fGrp <= this.curAssign.groupNo)
            this.studentGroup[i].groupNo = parseFloat(grp);
        else
            event.target.value = this.studentGroup[i].groupNo;
    }

    exportAsXLSX(aid) {
        var data = [];
        for (var i = 0; i < this.studentGroup.length; i++) {
            var item = this.studentGroup[i];
            var student = {
                studentId: item.studentId,
                class: this.curClass.classId + " - " + this.curClass.className,
                assignment: item.classAssignmentId + " - " + this.curAssign.name,
                officialStudentId: item.officialStudentId,
                fullname: item.fullname,
                gropupNo: item.groupNo,
                school: item.schoolName
            };
            data.push(student);
        }
        var tit = "BaiTap_" + this.curAssign.classId + "_" + this.curAssign.id;
        this.excel.exportAsExcelFile(data, tit);
    }

    isSame() {
        var res = true;
        for (var i = 0; i < this.studentGroup.length; i++) {
            if (this.studentGroupOld[i].groupNo != this.studentGroup[i].groupNo) {
                res = false;
                break;
            }
        }
        return res;
    }

    savestudentGroup() {
        if (this.isSame()) {
            this.showToastError("Không có thay đổi gì để cập nhật !!!");
        }
        else {
            let x = [];
            for (var i = 0; i < this.studentGroup.length; i++) {
                var item = this.studentGroup[i];
                var otem = this.studentGroupOld[i];
                if (item.groupNo != otem.groupNo) {
                    var css = {
                        id: item.id,
                        studentId: item.studentId,
                        ClassAssignmentId: item.classAssignmentId,
                        userId: item.userId,
                        groupNo: item.groupNo
                    };
                    x.push(css);
                }
            }
            var n = x.length;

            Utils.showSpinner(true);
            this.proTeacher.saveTeacherClassAssignmentStudentGroup(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    //console.log(rsp.data);
                    var data = this.studentGroup;
                    this.studentGroupOld = JSON.parse(JSON.stringify(data));

                    this.showToastSuccess("Bạn đã cập nhật nhóm thành công cho [" + n + "] sinh viên !");
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

            //console.log(x);
        }
    }
    ///////////// end Student Modal


    ////////////////////open Exam
    openExamModal(i, aid) {
        this.curAssign = this.assignments2[i];
        this.getTeacherClassAssignmentExam();
        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.examModal.config = config;
        this.examModal.show();
    }

    getTeacherClassAssignmentExam() {
        Utils.showSpinner(true);

        let x = {
            classAssignmentId: this.curAssign.id,
        };

        this.proTeacher.getTeacherClassAssignmentExam(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.exam = rsp.data.assignExam;
                this.examList = rsp.data.examList;
                var data = rsp.data.assignExam;
                if (this.exam == null) {
                    this.examIndex = "";
                    this.selExam = null;
                }
                else {
                    var index = 0;
                    for (var i = 0; i < this.examList.length; i++) {
                        if (this.examList[i].id == this.exam.id) {
                            this.selExam = this.examList[i];
                            index = i;
                            break;
                        }
                    }
                    this.examIndex = index.toString();
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
    selectExam(e) {
        if (e.target.value != null && e.target.value != "") {
            var index = parseInt(e.target.value);
            this.selExam = this.examList[index];
            //console.log(this.selExam);
        }
        else {
            this.selExam = null;
        }
    }
    saveExamForAssignment() {
        if (this.examIndex == "" || this.examIndex == null) {
            this.showToastError("Bạn vui lòng chọn đề thi !!");
        }
        else {
            var index = parseInt(this.examIndex);
            if (this.exam != null) {
                if (this.examList[index].id == this.exam.examId) {
                    this.showToastError("Không có gì để cập nhật !!");
                }
                else {
                    //var eid = this.examList[index].id;
                    this.saveTeacherClassAssignmentExam(index);
                    //console.log(this.examIndex);
                }
            }
            else
            {
                this.saveTeacherClassAssignmentExam(index);
                //console.log(this.examIndex);
            }
        }
    }

    saveTeacherClassAssignmentExam(index) {
        var dethi = this.examList[index];
        let x = {
            id: 0,
            classAssignmentId: this.curAssign.id,
            examId: dethi.id,
            note: dethi.examTitle + " | " + dethi.examDepartment + " | " + dethi.examSchool,
            status: 1,
            createdBy: null,
            createdOn: null,
            modifiedBy: null
        };
        if (this.exam == null) {
            x.id = 0;
            x.createdBy = this.curUser.id;
        }
        else {
            x.id = this.exam.id;
            x.createdBy = this.exam.createdBy;
            x.createdOn = this.exam.createdOn;
            x.modifiedBy = this.curUser.id;
        }
        Utils.showSpinner(true);
        this.proTeacher.saveTeacherClassAssignmentExam(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.exam = rsp.data;
                this.showToastSuccess("Bạn đã cập nhật đề thi thành công cho bài tập ONLINE !");
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
    ////////////////////end Exam 

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

import { Component, ViewChild, OnInit } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { Utils, Token } from '../../utilities';
import { TeacherProvider, ExcelProvider, StudentProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import * as XLSX from 'xlsx';

import * as moment from 'moment';
type AOA = any[][];
@Component({
    selector: 'app-teacher-class-score-config',
    templateUrl: './teacher-class-score-config.component.html',
    styleUrls: ['./teacher-class-score-config.component.css']
})
export class TeacherClassScoreConfigComponent implements OnInit {
    @ViewChild('warningModal', { static: false }) public warningModal: ModalDirective;
    @ViewChild('scModal', { static: false }) public scModal: ModalDirective;
    @ViewChild('scoringModal', { static: false }) public scoringModal: ModalDirective;
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
    scoreConfigs: any = [];
    assignments: any = [];
    totalPercentage: number = 0;
    scoredAssignments: any = [];
    isDeleteScoreConfig: boolean = false;
    curAction: any = {
        index: 0,
        id: 0
    };
    editingSC: any = {
        id: 0,
        classId: null,
        scoreType: "",
        description: "",
        percentage: 0,
        refAssignmentId: null,
        note: "",
        status: 0,
        createdBy: null,
        createdOn: null,
        modifiedBy: null,
        modifiedOn: null,
        resultStatus: "unscored",
        submitStatus: "not-submitted"
    };
    refAssignmentId: string = "0";
    percentageStr: string = '';
    // students
    studentScoreOld: any = [];
    studentScore: any = [];
    curConfig: any = {};
    constructor(
        private router: Router,
        private proTeacher: TeacherProvider,
        private toastr: ToastrService,
        private excel: ExcelProvider,
        private proStudent: StudentProvider
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
        this.getTeacherClassScoreConfig();
    }

    unSelectClass() {
        this.show = false;
        this.selectStyleBtn = {};
    }

    showRefAssignment(aid) {
        var str = "";
        if (aid != null) {
            var arr = this.assignments.filter(d => d.id == aid);
            var item = arr[0];
            str = str + "id#[" + item.id + "] - " + item.name;
        }
        return str;
    }

    //// Start
    getTeacherClassScoreConfig() {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.classId,
        };

        this.proTeacher.getTeacherClassScoreConfig(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                this.scoreConfigs = rsp.data.scoreConfigs;
                this.assignments = rsp.data.assignments;
                var totPer = 0;
                for (var i = 0; i < this.scoreConfigs.length; i++) {
                    var item = this.scoreConfigs[i];
                    if (item.resultStatus == 'scored' || item.submitStatus == 'submitted')
                        this.scoredAssignments.push(item.refAssignmentId);
                    totPer = totPer + item.percentage;
                }
                this.totalPercentage = totPer;
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

    checkScoredAssignment() {
        var totPer = 0;
        this.scoredAssignments = [];
        for (var i = 0; i < this.scoreConfigs.length; i++) {
            var item = this.scoreConfigs[i];
            if (item.resultStatus == 'scored' || item.submitStatus == 'submitted')
                this.scoredAssignments.push(item.refAssignmentId);
            totPer = totPer + item.percentage;
        }
        this.totalPercentage = totPer;
    }

    openEditModal(index) {
        if (index != null) {
            var item = this.scoreConfigs[index];
            this.editingSC = {
                id: item.id,
                classId: item.classId,
                scoreType: item.scoreType,
                description: item.description,
                percentage: item.percentage,
                refAssignmentId: item.refAssignmentId,
                note: item.note,
                status: item.status,
                createdBy: item.createdBy,
                createdOn: item.createdOn,
                modifiedBy: item.modifiedBy,
                modifiedOn: item.modifiedOn,
                resultStatus: item.resultStatus,
                submitStatus: item.submitStatus
            };
            if (this.editingSC.refAssignmentId != null)
                this.refAssignmentId = this.editingSC.refAssignmentId.toString();
            else
                this.refAssignmentId = "0";
        }
        else {
            this.editingSC = {
                id: 0,
                classId: this.curClass.classId,
                scoreType: "",
                description: "",
                percentage: 0,
                refAssignmentId: 0,
                note: "",
                status: 1,
                createdBy: null,
                createdOn: null,
                modifiedBy: null,
                modifiedOn: null,
                resultStatus: "unscored",
                submitStatus: "not-submitted"
            };
            this.refAssignmentId = "0";
        }
        //console.log(this.editingSC);
        //console.log(this.refAssignmentId);
        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.scModal.config = config;
        this.scModal.show();
    }

    deleteScoreConfig(i, sid) {
        this.isDeleteScoreConfig = true;
        this.warningModal.show();
        this.curAction = {
            index: i,
            id: sid
        };
    }

    completeScoreConfig(i, sid) {
        this.isDeleteScoreConfig = false;
        this.warningModal.show();
        this.curAction = {
            index: i,
            id: sid
        };
    }

    percentageChange(e) {
        var newPer = parseInt(e.target.value);
        var arr1 = this.scoreConfigs.filter(d => d.id == this.editingSC.id);
        var self = 0;
        if (arr1.length > 0) {
            var item = arr1[0];
            self = item.percentage;
        }
        var avail = 100 - this.totalPercentage + self;
        if (newPer > avail)
            this.percentageStr = 'Bạn chỉ còn ' + avail + '%, bạn đã vượt quá !';
        else
            this.percentageStr = '';
    }

    refAssignmentChange(e) {
        var refId = parseInt(e.target.value);
        this.editingSC.refAssignmentId = refId;
    }

    doNextSC() {
        this.warningModal.hide();
        if (this.isDeleteScoreConfig) {
            this.deleteTeacherClassScoreConfig(this.curAction.index, this.curAction.id);
        }
        else {
            this.completeTeacherClassScoreConfig(this.curAction.index, this.curAction.id);
        }
    }

    deleteTeacherClassScoreConfig(index, sid) {
        Utils.showSpinner(true);

        let x = {
            id: sid,
            modifiedBy: this.curUser.id
        };

        this.proTeacher.deleteTeacherClassScoreConfig(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.scoreConfigs.splice(index, 1);
                this.checkScoredAssignment();
                this.showToastSuccess("Bạn đã xóa [Cột điểm] thành công !");
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

    completeTeacherClassScoreConfig(index, sid) {
        Utils.showSpinner(true);

        let x = {
            id: sid,
            modifiedBy: this.curUser.id
        };

        this.proTeacher.completeClassScoreConfig(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.scoreConfigs[index] = rsp.data;
                //this.checkScoredAssignment();
                this.showToastSuccess("Bạn đã hoàn tất [Cột điểm] thành công,<br/> Bạn không thể chỉnh sửa nữa !");
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

    saveSC() {
        if (this.checkSameSC()) {
            this.showToastError("Không có gì thay đổi để cập nhật !");
        }
        else {
            var str = this.checkFullSC();
            if (str != "")
                this.showToastError('<p class="text-small small">' + str + '</p>');
            else {
                this.saveTeacherClassScoreConfig();
            }
        }
    }

    saveTeacherClassScoreConfig() {
        Utils.showSpinner(true);

        let x = this.editingSC;
        x.modifiedBy = this.curUser.id;

        this.proTeacher.saveTeacherClassScoreConfig(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingSC = rsp.data;
                var index = 0;
                for (var i = 0; i < this.scoreConfigs.length; i++)
                    if (this.scoreConfigs[i].id == rsp.data.id) {
                        index = i;
                        break;
                    }
                this.scoreConfigs[index] = rsp.data;
                this.checkScoredAssignment();
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

    createSC() {
        var str = this.checkFullSC();
        if (str != "")
            this.showToastError('<p class="text-small small">' + str + '</p>');
        else {
            this.createNewClassScoreConfig();
        }
    }

    createNewClassScoreConfig() {
        Utils.showSpinner(true);

        let x = this.editingSC;
        x.id = 0;
        x.createdBy = this.curUser.id;

        //console.log(x);
        this.proTeacher.createNewClassScoreConfig(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingSC = rsp.data;
                this.scoreConfigs.push(rsp.data);
                this.checkScoredAssignment();
                this.showToastSuccess('<p class="small">Bạn đã thêm mới thành công ! </p>');
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

    checkFullSC() {
        var str = '';
        if (this.editingSC.scoreType == "")
            str = str + "Vui lòng chọn [Hình thức].<br/>";
        if (this.editingSC.description.trim().length == 0)
            str = str + "Vui lòng nhập liệu cho [Mô tả].<br/>";
        if (this.editingSC.percentage == 0 || this.percentageStr != '')
            str = str + "Vui lòng kiểm tra [Phần trăm trọng số].<br/>";
        if (this.editingSC.note.trim().length == 0)
            str = str + "Vui lòng nhập liệu cho [Ghi chú] !";
        return str;
    }

    checkSameSC() {
        var arr1 = this.scoreConfigs.filter(d => d.id == this.editingSC.id);
        var item = arr1[0];
        if (this.editingSC.classId != item.classId)
            return false;
        if (this.editingSC.scoreType != item.scoreType)
            return false;
        if (this.editingSC.description != item.description)
            return false;
        if (this.editingSC.percentage != item.percentage)
            return false;
        if (this.editingSC.refAssignmentId != item.refAssignmentId)
            return false;
        if (this.editingSC.note != item.note)
            return false;
        return true;
    }
    //// End

    /// Scoring
    scoreThisAssgnment(i, scid) {
        this.curConfig = this.scoreConfigs[i];
        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.scoringModal.config = config;
        this.scoringModal.show();
        this.getTeacherClassStudentScore(scid);
    }

    inputScore(i, scid) {
        this.curConfig = this.scoreConfigs[i];
        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.scoringModal.config = config;
        this.scoringModal.show();
        this.getTeacherClassStudentScore(scid);
    }

    scoreChange(event: any, j) {
        //console.log(event.target.value);
        var score = event.target.value;
        if(score.trim()!="")
            this.studentScore[j].score = parseFloat(score);
    }

    getTeacherClassStudentScore(scid) {
        Utils.showSpinner(true);

        let x = {
            id: scid,
            classId: this.curClass.classId,
            createdBy: this.curUser.id
        };

        this.proTeacher.getTeacherClassStudentScore(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                //this.studentScoreOld = rsp.data;
                this.studentScore = rsp.data;
                var data = rsp.data;
                this.studentScoreOld = JSON.parse(JSON.stringify(data));
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

    exportAsXLSX(scid): void {
        var data = [];
        for (var i = 0; i < this.studentScore.length; i++) {
            var item = this.studentScore[i];
            var student = {
                studentId: item.studentId,
                classId: item.classId,
                officialStudentId: item.officialStudentId,
                fullname: item.fullname,
                refScoreConfig: scid,
                score: "",
                group:item.groupNo
            };
            data.push(student);
        }
        var tit = "BangDiem_" + this.curConfig.classId +"_"+ this.curConfig.id;
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
            this.updateByExcel(data);
        };
        reader.readAsBinaryString(target.files[0]);
        evt.srcElement.value = null;
    }
    updateByExcel(data: any) {
        //console.log(data);
        //console.log(this.curConfig);
        var n=0;
        if (data != null && data.length > 1) {
            var head = data[0];
            if (head[0] == "studentId" && head[1] == "classId" && head[2] == "officialStudentId"
                && head[3] == "fullname" && head[4] == "refScoreConfig" && head[5] == "score") {
                for (var i = 1; i < data.length; i++) {
                    var s = data[i];
                    var sid = s[0];
                    var cid = s[1];
                    var scid = s[4];
                    var score = s[5];
                    var j = i - 1;
                    if (this.studentScore[j].studentId == sid
                        && this.studentScore[j].classId == cid
                        && this.studentScore[j].refScoreConfig == scid) {
                        if (this.curConfig.refAssignmentId > 0 && this.studentScore[j].submissions != null && score > 0) {
                            this.studentScore[j].score = score;
                            n++;
                        }
                        else if (this.curConfig.refAssignmentId == null && this.studentScore[j].submissions == null && score > 0) {
                            this.studentScore[j].score = score;
                            n++;
                        }
                    }
                }
                if(n==0)
                {
                    this.showToastError("File excel dữ liệu không chính xác !");
                }
                else
                {
                    this.showToastSuccess("Đã cập nhật thành công cho ["+n+"] sinh viên !");
                }
            }
            else {
                this.showToastError("File excel không đúng định dạng, vui lòng tải file Template !");
            }
        }
        else {
            this.showToastError("File excel không có data !");
        }
    }

    downloadAttachment(id, filename) {
        Utils.showSpinner(true);
        let x = {
            attachmentId: id
        };
        this.proStudent.downloadAttachment(x).subscribe(data => {
            saveAs(data, filename);
            Utils.showSpinner(false);
        });
    }

    isSame() {
        var res = true;
        for (var i = 0; i < this.studentScore.length; i++) {
            if (this.studentScoreOld[i].score != this.studentScore[i].score)
                {
                    res = false;
                    break;
                }
        }
        return res;
    }

    saveStudentScore() {
        //console.log(this.studentScore);
        //console.log(this.studentScore);
        //console.log(this.studentScoreOld);
        if (this.isSame()) {
            this.showToastError("Không có thay đổi gì để cập nhật !!!");
        }
        else {
            let x = [];
            for (var i = 0; i < this.studentScore.length; i++) {
                var item = this.studentScore[i];
                var otem = this.studentScoreOld[i];
                if (item.score != otem.score) {
                    var css = {
                        id: item.id,
                        classId: item.classId,
                        studentId:item.studentId,
                        classStudentId: item.classStudentId,
                        scoreType: item.scoreType,
                        score: item.score,
                        percentage: item.percentage,
                        refScoreConfig: item.refScoreConfig,
                        note: item.note,
                        createdBy: item.createdBy,
                        modifiedBy: this.curUser.id,
                        status: 1,
                        fullname: item.fullname
                    };
                    x.push(css);
                }
            }
            var n = x.length;
            var str ="";
            for(var i = 0; i < x.length; i++)
            {
                if(x[i].score < 0 || x[i].score > 10)
                    str=str + "Điểm số của sv ["+x[i].fullname+"] không hợp lệ ! <br/>";
            }
            if(str=="")
            {
                Utils.showSpinner(true);
                this.proTeacher.saveTeacherClassStudentScore(x).subscribe((rsp: any) => {
                    if (rsp.success) {
                        //console.log(rsp.data);
                        var data = this.studentScore;
                        this.studentScoreOld = JSON.parse(JSON.stringify(data));
                        
                        this.showToastSuccess("Bạn đã cập nhật điểm thành công cho [" + n + "] sinh viên !");
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
            else
            {
                this.showToastError(str);
            }
            //console.log(x);
        }
    }
    //// end scoring

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

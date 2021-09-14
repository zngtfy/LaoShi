import { Component, ViewChild, OnInit } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { Utils, Token } from '../../utilities';
import { TeacherProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    selector: 'app-teacher-exam',
    templateUrl: './teacher-exam.component.html',
    styleUrls: ['./teacher-exam.component.css']
})
export class TeacherExamComponent implements OnInit {
    element: HTMLInputElement;
    @ViewChild('confirmModal1', { static: true }) public confirmModal1: ModalDirective;
    @ViewChild('confirmModal', { static: true }) public confirmModal: ModalDirective;
    @ViewChild('examModal', { static: true }) public examModal: ModalDirective;
    @ViewChild('questionModal', { static: true }) public questionModal: ModalDirective;
    sizeSub: number = 1;
    sizeQuest: number = 50;
    size: number = 5;
    message: any = '';
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
    subjects: any = {
        data: [],
        totalRecords: 0,
        page: 0,
        size: 1,
        totalPages: 0,
    };
    selectSub: boolean = false;
    selectedSubject: any = null;
    ///
    exams: any = {
        data: [],
        totalRecords: 0,
        page: 0,
        size: 5,
        totalPages: 0,
    };
    editingExam: any = {
        exam: null,
        examDetail: []
    };
    isEditExam: boolean = false;
    searchQuestion: string = 'name';
    isLoadQuestion: boolean = false;
    dataQuest: any = [];
    questionToAdd: any = null;
    examOld: any = {};
    ///
    questions: any = {
        data: [],
        totalRecords: 0,
        page: 0,
        size: 5,
        totalPages: 0,
    };
    editingQuestion: any = {
        question: null,
        answers: []
    };
    isEditQuest: boolean = false;
    questionOld: any = {};
    answersOld:any=[];

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
            this.getTeacherClassSubject(1);
        }
    }

    getTeacherClassSubject(cPage) {
        Utils.showSpinner(true);

        let x = {
            userId: this.curUser.id,
            page: cPage,
            size: this.sizeSub
        };

        this.proTeacher.getTeacherClassSubject(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.subjects = rsp.data;
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

    pageChanged(event: any, type): void {
        //console.log('Page changed to: ' + event.page);
        //console.log('Number items per page: ' + event.itemsPerPage);
        if (type == "subject")
            this.getTeacherClassSubject(event.page);
        else if (type == "exam")
            this.getTeacherSubjectExam(event.page);
        else if (type == "question")
            this.getTeacherSubjectExamQuestion(event.page);
    }
    getSTT(i, type) {
        var page = 1;
        if (type == "subject")
            page = this.subjects.page;
        else if (type == "exam")
            page = this.exams.page;
        else if (type == "question")
            page = this.questions.page;
        var stt = (page - 1) * this.size;
        stt = stt + i + 1;
        return stt;
    }
    selectSubject(i) {
        this.selectSub = true;
        this.selectedSubject = this.subjects.data[i];
        this.getTeacherSubjectExamAndQuestion();
    }
    unSelectSubject() {
        this.selectSub = false;
        this.selectedSubject = null;
    }

    ///////////////////// exam
    getTeacherSubjectExamAndQuestion() {
        Utils.showSpinner(true);

        let x = {
            subjectId: this.selectedSubject.id,
            page: 1,
            size: this.size,
            sizeQuest: this.sizeQuest
        };

        this.proTeacher.getTeacherSubjectExamAndQuestion(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.exams = rsp.data.exams;
                this.questions = rsp.data.questions;
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

    getTeacherSubjectExam(cPage) {
        Utils.showSpinner(true);

        let x = {
            subjectId: this.selectedSubject.id,
            page: cPage,
            size: this.size
        };

        this.proTeacher.getTeacherSubjectExam(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.exams = rsp.data;
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

    getTeacherSubjectExamQuestion(cPage) {
        Utils.showSpinner(true);

        let x = {
            subjectId: this.selectedSubject.id,
            page: cPage,
            size: this.sizeQuest
        };

        this.proTeacher.getTeacherSubjectExamQuestion(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.questions = rsp.data;
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

    deleteExam(i, id) {
        var item = this.exams.data[i];
        this.editingExam.exam = item;
        this.confirmModal.show();
    }
    deleteThisExam() {
        //console.log(this.editingExam.exam);
        Utils.showSpinner(true);
        var id = this.editingExam.exam.id
        let x = {
            id: id,
        };

        this.proTeacher.deleteTeacherClassExam(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                //this.editingExam = rsp.data;
                var i = 0;
                for (i = 0; i < this.exams.data.length; i++) {
                    if (this.exams.data[i].id == this.editingExam.exam.id)
                        break;
                }
                this.exams.data.splice(i, 1);
                this.showToastSuccess("Bạn đã xóa đề thi [" + this.editingExam.exam.examTitle + "] thành công!");
                this.editingExam = {
                    exam: {
                        id: 0,
                        examTitle: "",
                        examDepartment: "",
                        examSchool: this.selectedSubject.schoolName,
                        subjectId: this.selectedSubject.id,
                        examType: "TracNghiem",
                        examLevel: 0,
                        totMinutes: 0,
                        totalQuestion: 0,
                        totalScore: 0,
                        note: "",
                        status: 1,
                        createdBy: this.curUser.id,
                        createdOn: null,
                        modifiedBy: null,
                        modifiedOn: null
                    },
                    examDetail: []
                };
                this.confirmModal.hide();
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

    openExamModal(i, id) {
        if (i == null) {
            this.isEditExam = false;
            this.editingExam = {
                exam: {
                    id: 0,
                    examTitle: "",
                    examDepartment: "",
                    examSchool: this.selectedSubject.schoolName,
                    subjectId: this.selectedSubject.id,
                    examType: "TracNghiem",
                    examLevel: 0,
                    totMinutes: 0,
                    totalQuestion: 0,
                    totalScore: 0,
                    note: "",
                    status: 1,
                    createdBy: this.curUser.id,
                    createdOn: null,
                    modifiedBy: null,
                    modifiedOn: null
                },
                examDetail: []
            };
            let config: any = {
                backdrop: true,
                ignoreBackdropClick: true
            };
            this.examModal.config = config;
            this.examModal.show();
        }
        else {
            this.isEditExam = true;
            this.getExamDetail(id);
        }
        this.dataQuest = [];
        this.searchQuestion = '';
    }
    getExamDetail(id) {
        Utils.showSpinner(true);

        let x = {
            examId: id,
        };

        this.proTeacher.getExamDetail(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingExam = rsp.data;
                let item = JSON.parse(JSON.stringify(rsp.data.exam));
                this.examOld = item;
                let config: any = {
                    backdrop: true,
                    ignoreBackdropClick: true
                };
                this.examModal.config = config;
                this.examModal.show();
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

    // autoComplete Question
    selectEvent(item) {
        // do something with selected item
        //console.log(item);
        this.questionToAdd = item;
    }

    onChangeSearch(val: string) {
        // fetch remote data from here
        // And reassign the 'data' which is binded to 'data' property.
        if (val.length > 2) {
            this.isLoadQuestion = true;
            let x = {
                keyword: val,
                examId: this.editingExam.exam.id,
                subjectId: this.selectedSubject.id,
            };

            this.proTeacher.searchQuestionForExam(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    //console.log(rsp.data);
                    this.dataQuest = rsp.data;
                } else {
                    this.message = rsp.message;
                }

                this.isLoadQuestion = false;

                if (this.message !== '') {
                    this.showToastError(this.message);
                }
            }, err => {
                Utils.log(err);
                this.isLoadQuestion = false;
            });
        }
    }

    onFocused(e) {
        // do something when input is focused
    }
    deleteQuestionOfExam(i) {
        Utils.showSpinner(true);
        var id = this.editingExam.examDetail[i].id
        let x = {
            examDetailId: id,
        };

        this.proTeacher.deleteQuestionFromExam(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                //this.editingExam = rsp.data;
                this.editingExam.examDetail.splice(i, 1);
                this.showToastSuccess("Bạn đã xóa câu hỏi thành công!");
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
    addQuestionForExam() {
        if (this.questionToAdd == null || this.questionToAdd.id < 1) {
            this.showToastError("Chưa chọn câu hỏi để thêm !");
        }
        else {
            Utils.showSpinner(true);
            let x = {
                examId: this.editingExam.exam.id,
                questionId: this.questionToAdd.id,
                userId: this.curUser.id
            };

            this.proTeacher.addQuestionForExam(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    //console.log(rsp.data);
                    //this.editingExam = rsp.data;
                    this.editingExam.examDetail.push(rsp.data);
                    this.dataQuest = [];
                    this.searchQuestion = '';
                    this.questionToAdd = null;
                    this.showToastSuccess("Bạn đã thêm câu hỏi thành công!");
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
    }

    createNewExam() {
        var str = this.checkFullExam();
        if (str == "") {
            //console.log("Ready-to-create");
            //console.log(this.editingExam.exam);
            this.createTeacherClassExamInfo();
        }
        else {
            str = '<p class="small">' + str + '</p>';
            this.showToastError(str);
        }
    }

    createTeacherClassExamInfo() {
        Utils.showSpinner(true);
        this.editingExam.exam.createdBy = this.curUser.id;
        let x = this.editingExam.exam;

        this.proTeacher.createTeacherClassExamInfo(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingExam.exam = rsp.data;
                this.exams.data.push(rsp.data);
                this.isEditExam = true;
                var item = JSON.parse(JSON.stringify(rsp.data));
                this.examOld = item;
                this.showToastSuccess("Bạn đã thêm Đề thi thành công!");
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

    saveExamInfo() {
        if (this.checkSameExam()) {
            this.showToastError("Không có gì thay đổi để cập nhật !");
        }
        else {
            var str = this.checkFullExam();
            if (str == "") {
                //console.log("Ready-to-Save");
                this.saveTeacherClassExamInfo();
                //console.log(this.editingExam.exam);
                //console.log(this.examOld);
            }
            else {
                str = '<p class="small">' + str + '</p>';
                this.showToastError(str);
            }
        }
    }

    saveTeacherClassExamInfo() {
        Utils.showSpinner(true);
        this.editingExam.exam.modifiedBy = this.curUser.id;
        let x = this.editingExam.exam;

        this.proTeacher.saveTeacherClassExamInfo(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingExam.exam = rsp.data;
                var i = 0;
                for (i = 0; i < this.exams.data.length; i++) {
                    if (this.exams.data[i].id == rsp.data.id)
                        break;
                }
                this.exams.data[i] = rsp.data;
                var item = JSON.parse(JSON.stringify(rsp.data));
                this.examOld = item;
                this.showToastSuccess("Bạn đã cập nhật Đề thi thành công!");
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

    checkFullExam() {
        var str = "";
        if (this.editingExam.exam.examTitle.trim() == "")
            str = str + "Bạn vui lòng nhập [Tên Đề thi ]. <br/>";
        if (this.editingExam.exam.examDepartment.trim() == "")
            str = str + "Bạn vui lòng nhập [Khoa phụ trách]. <br/>";
        if (this.editingExam.exam.examSchool.trim() == "")
            str = str + "Bạn vui lòng nhập [Trường ]. <br/>";
        if (this.editingExam.exam.examLevel == "" || this.editingExam.exam.examLevel == null)
            str = str + "Bạn vui lòng chọn [độ khó ]. <br/>";
        if (this.editingExam.exam.totMinutes < 10 || this.editingExam.exam.totMinutes > 90)
            str = str + "Thời gian không hợp lệ, chì từ 10 đến 90 phút. <br/>";
        if (this.editingExam.exam.totalQuestion < 10 || this.editingExam.exam.totalQuestion > 90)
            str = str + "Số lượng câu không hợp lệ, chì từ 10 đến 90 câu. <br/>";
        if (this.editingExam.exam.totalScore < 10 || this.editingExam.exam.totalScore > 90)
            str = str + "Tổng điểm không hợp lệ, chì từ 10 đến 90 điểm. <br/>";
        if (this.editingExam.exam.note.trim() == "")
            str = str + "Bạn vui lòng nhập [Ghi chú]. <br/>";
        return str;
    }
    examLevelChange(e) {
        var val = e.target.value;
        if (val != "") {
            this.editingExam.exam.examLevel = parseInt(val);
        }
    }
    checkSameExam() {
        if (this.editingExam.exam.examTitle != this.examOld.examTitle)
            return false;
        if (this.editingExam.exam.examDepartment != this.examOld.examDepartment)
            return false;
        if (this.editingExam.exam.examSchool != this.examOld.examSchool)
            return false;
        if (this.editingExam.exam.examLevel != this.examOld.examLevel)
            return false;
        if (this.editingExam.exam.totMinutes != this.examOld.totMinutes)
            return false;
        if (this.editingExam.exam.totalQuestion != this.examOld.totalQuestion)
            return false;
        if (this.editingExam.exam.totalScore != this.examOld.totalScore)
            return false;
        if (this.editingExam.exam.note != this.examOld.note)
            return false;
        return true;
    }
    ////////////////////
    deleteQuestion(i, id) {
        var item = this.questions.data[i];
        this.editingQuestion.question = item;
        this.confirmModal1.show();
    }
    deleteThisQuestion() {
        Utils.showSpinner(true);
        var id = this.editingQuestion.question.id
        let x = {
            id: id,
        };

        this.proTeacher.deleteTeacherExamQuestion(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                //this.editingExam = rsp.data;
                var i = 0;
                for (i = 0; i < this.questions.data.length; i++) {
                    if (this.questions.data[i].id == this.editingQuestion.question.id)
                        break;
                }
                this.questions.data.splice(i, 1);
                this.showToastSuccess("Bạn đã xóa câu hỏi [" + this.editingQuestion.question.id + "] thành công!");
                this.editingQuestion = {
                    question: {
                        id: 0,
                        questionInstruction: "",
                        questionContent: "",
                        questionImage: null,
                        questionType: "",
                        totMinutes: 0,
                        totScore: 0,
                        subjectId: this.selectedSubject.id,
                        note: "",
                        status: 1,
                        createdBy: this.curUser.id,
                        createdOn: null,
                        modifiedBy: null,
                        modifiedOn: null,
                        imageBase64: null
                    },
                    answers: []
                };
                this.confirmModal1.hide();
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

    openQuestionModal(i, id) {
        if (i == null) {
            this.isEditQuest = false;
            this.editingQuestion = {
                question: {
                    id: 0,
                    questionInstruction: "",
                    questionContent: "",
                    questionImage: null,
                    questionType: "",
                    totMinutes: 0,
                    totScore: 0,
                    subjectId: this.selectedSubject.id,
                    note: "",
                    status: 1,
                    createdBy: this.curUser.id,
                    createdOn: null,
                    modifiedBy: null,
                    modifiedOn: null,
                    imageBase64: null
                },
                answers: []
            };
            let config: any = {
                backdrop: true,
                ignoreBackdropClick: true
            };
            this.questionModal.config = config;
            this.questionModal.show();
        }
        else {
            this.isEditQuest = true;
            this.getQuestionDetail(id);
        }
    }

    getQuestionDetail(id) {
        Utils.showSpinner(true);

        let x = {
            questionId: id,
        };

        this.proTeacher.getQuestionDetail(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingQuestion = rsp.data;
                let item = JSON.parse(JSON.stringify(rsp.data.question));
                this.questionOld = item;
                let lsAns = JSON.parse(JSON.stringify(rsp.data.answers));
                this.answersOld = lsAns;
                let config: any = {
                    backdrop: true,
                    ignoreBackdropClick: true
                };
                this.questionModal.config = config;
                this.questionModal.show();
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

    deleteAnswerOfQuest(i) {
        this.editingQuestion.answers.splice(i, 1);
    }

    saveQuestionInfo() {
        if (this.checkSameQuestion()) {
            this.showToastError("Không có gì thay đổi để cập nhật !");
        }
        else {
            var str = this.checkFullQuestion();
            if (str == "") {
                //console.log("Ready-to-Save-Question");
                this.saveTeacherExamQuestionInfo();
            }
            else {
                str = '<p class="small">' + str + '</p>';
                this.showToastError(str);
            }
        }
    }

    saveTeacherExamQuestionInfo() {
        Utils.showSpinner(true);
        this.editingQuestion.question.modifiedBy = this.curUser.id;
        let x = this.editingQuestion.question;

        this.proTeacher.saveTeacherExamQuestionInfo(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingQuestion.question = rsp.data;
                var i = 0;
                for (i = 0; i < this.questions.data.length; i++) {
                    if (this.questions.data[i].id == rsp.data.id)
                        break;
                }
                this.questions.data[i] = rsp.data;
                var item = JSON.parse(JSON.stringify(rsp.data));
                this.questionOld = item;
                this.showToastSuccess("Bạn đã cập nhật Câu hỏi thành công!");
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

    checkFullQuestion() {
        var str = "";
        if (this.editingQuestion.question.questionType == "")
            str = str + "Bạn vui lòng chọn [Loại câu hỏi]. <br/>";
        if (this.editingQuestion.question.questionContent.trim() == "")
            str = str + "Bạn vui lòng nhập [Nội dung câu hỏi]. <br/>";
        if (this.editingQuestion.question.questionInstruction.trim() == "")
            str = str + "Bạn vui lòng nhập [Hướng dẫn câu hỏi ]. <br/>";
        if (this.editingQuestion.question.totMinutes < 1 || this.editingQuestion.question.totMinutes > 3)
            str = str + "Thời gian không hợp lệ, chì từ 1 đến 3 phút. <br/>";
        if (this.editingQuestion.question.note.trim() == "")
            str = str + "Bạn vui lòng nhập [Ghi chú câu hỏi]. <br/>";
        return str;
    }

    checkSameQuestion() {
        if (this.editingQuestion.question.questionType != this.questionOld.questionType)
            return false;
        if (this.editingQuestion.question.totMinutes != this.questionOld.totMinutes)
            return false;
        if (this.editingQuestion.question.totScore != this.questionOld.totScore)
            return false;
        if (this.editingQuestion.question.questionContent != this.questionOld.questionContent)
            return false;
        if (this.editingQuestion.question.questionImage != this.questionOld.questionImage)
            return false;
        if (this.editingQuestion.question.questionInstruction != this.questionOld.questionInstruction)
            return false;
        if (this.editingQuestion.question.note != this.questionOld.note)
            return false;
        return true;
    }

    createNewQuestion() {
        var str = this.checkFullQuestion();
        if (str == "") {
            //console.log("Ready-to-create-question");
            //console.log(this.editingExam.exam);
            this.createTeacherExamQuestionInfo();
        }
        else {
            str = '<p class="small">' + str + '</p>';
            this.showToastError(str);
        }
    }

    createTeacherExamQuestionInfo() {
        Utils.showSpinner(true);
        this.editingQuestion.question.createdBy = this.curUser.id;
        let x = this.editingQuestion.question;

        this.proTeacher.createTeacherExamQuestionInfo(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingQuestion.question = rsp.data;
                this.questions.data.push(rsp.data);
                this.isEditQuest = true;
                var item = JSON.parse(JSON.stringify(rsp.data));
                this.questionOld = item;
                this.showToastSuccess("Bạn đã thêm Câu hỏi thành công!");
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

    saveQuestAnswers() {
        if(this.checkSameAnswers()==false)
        {
            var str = this.checkAnswers();
            if(str=="")
            {
                //console.log("Ready-to-Save-Answers");
                this.saveTeacherQuestionAnswers();
            }
            else
            {
                str = '<p class="small">' + str + '</p>';
                this.showToastError(str);
            }
        }
        else
        {
            var str = '<p class="small"> Không có gì thay đổi để cập nhật !!! </p>';
            this.showToastError(str);
        }
    }

    saveTeacherQuestionAnswers()
    {
        Utils.showSpinner(true);
        this.editingQuestion.question.createdBy = this.curUser.id;
        let x = {
            listAnswer: this.editingQuestion.answers,
            subjectId: this.editingQuestion.question.subjectId,
            questionId: this.editingQuestion.question.id,
        };

        this.proTeacher.saveTeacherQuestionAnswers(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.editingQuestion = rsp.data;
                let item = JSON.parse(JSON.stringify(rsp.data.question));
                this.questionOld = item;
                let lsAns = JSON.parse(JSON.stringify(rsp.data.answers));
                this.answersOld = lsAns;
                this.showToastSuccess("Bạn đã lưu [câu trả lời] cho [Câu hỏi] thành công!");
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

    checkSameAnswers()
    {
        var n=0;
        for(var i=0; i<this.editingQuestion.answers.length; i++)
        {
            let ans = this.editingQuestion.answers[i];
            for(var j=0; j<this.answersOld.length;j++)
            {
                let ansO = this.answersOld[j];
                if(ans.id == ansO.id)
                {
                    n++;
                    if (ans.answerContent != ansO.answerContent)
                        return false;
                    if (ans.answerImage != ansO.answerImage)
                        return false;
                    if (ans.isCorrect != ansO.isCorrect)
                        return false;
                }
            }
        }
        if(n!=this.answersOld.length)
            return false;
        if(this.editingQuestion.answers.length!=this.answersOld.length)
            return false;
        return true;
    }

    checkAnswers()
    {
        var str = "";
        var totScore = 0;
        var totAns = this.editingQuestion.answers.length;
        for(var i=0; i<this.editingQuestion.answers.length;i++)
        {
            totScore = totScore + this.editingQuestion.answers[i].score;
            if(this.editingQuestion.answers[i].answerContent.trim()=="")
            {
                str = str + "Vui lòng nhập nội dung cho câu trả lời thứ ["+ (i+1).toString() + "]<br/>";
            }
        }
        if(totAns==1)
            str = str + "Phải có 02 câu trả lời trở lên <br/>";
        if(totScore == 0)
            str = str + "Bắt buộc phải có 1 lựa chọn đúng <br/>";
        if(totScore == totAns)
            str = str + "Số câu trả lời đúng phải nhỏ hơn tổng số câu trả lời <br/>";
        
        return str;
    }
    addAnswerToQuestion() {
        let item ={
            id: 0,
            questionId: this.editingQuestion.question.id,
            answerContent: "",
            answerImage: null,
            answerType: "Ans-Text",
            isCorrect: false,
            score: 0,
            status: 1,
            createdBy: this.curUser.id,
            createdOn: null,
            modifiedBy: null,
            modifiedOn: null,
            imageBase64:null
        };
        this.editingQuestion.answers.push(item);
    }
    isCorrectChange(e, i)
    {
        //console.log(e.target.checked);
        if(e.target.checked)
            this.editingQuestion.answers[i].score = 1;
        else
            this.editingQuestion.answers[i].score = 0;
    }
    ///////////////
    uploader_click(i) {
        var id = "uploader_" + i;
        this.element = document.getElementById(id) as HTMLInputElement;
        this.element.click();
    }
    handlerUpload($event, type, i) {
        //console.log(type, i);
        this.previewImage($event.target, type, i);
    }
    previewImage(inputValue: any, type, i): void {
        var file: File = inputValue.files[0];
        //console.log(file);
        var myReader: FileReader = new FileReader();

        myReader.onloadend = (e) => {
            if (type == "question") {
                this.editingQuestion.question.questionImage = myReader.result;
                this.editingQuestion.question.imageBase64 = myReader.result.toString().replace('data:image/jpeg;base64,', '').replace('data:image/png;base64,', '');
            }
            else {
                this.editingQuestion.answers[i].answerImage = myReader.result;
                this.editingQuestion.answers[i].imageBase64 = myReader.result.toString().replace('data:image/jpeg;base64,', '').replace('data:image/png;base64,', '');
            }
        }
        myReader.readAsDataURL(file);
    }
    clearImage(type, i) {
        if (type == "question") {
            this.editingQuestion.question.questionImage = null;
            this.editingQuestion.question.imageBase64 = null;
        }
        else {
            this.editingQuestion.answers[i].answerImage = null;
            this.editingQuestion.answers[i].imageBase64 = null;
        }
    }

    /////

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

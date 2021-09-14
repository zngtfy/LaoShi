import { Component, ViewChild, OnInit } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { NgxFileDropEntry, FileSystemFileEntry, FileSystemDirectoryEntry } from 'ngx-file-drop';
import { HttpHeaders  } from '@angular/common/http';
import { Utils, Token } from '../../utilities';
import { StudentProvider, FileProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { saveAs } from 'file-saver';
import * as moment from 'moment';

@Component({
    selector: 'app-mycourse-assigment',
    templateUrl: './mycourse-assigment.component.html',
    styleUrls: ['./mycourse-assigment.component.css']
})
export class MycourseAssigmentComponent implements OnInit {
    public files: NgxFileDropEntry[] = [];
    //sFiles:any =[];
    @ViewChild('uploadModal', { static: false }) public uploadModal: ModalDirective;
    @ViewChild('infoModal', { static: false }) public infoModal: ModalDirective;
    isCollapsed: boolean = false;
    message: string = "";
    size: number = 5;
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
    curClass: any = {
        ClassId: 0,
        ClassCode: "",
        ClassName: "",
        SubjectId: 0,
        Venue: "",
        Description: "",
        Images: "",
        Semester: 0,
        SchoolYear: "",
        TotalSession: 20,
        Note: "",
        Status: 0,
        TeacherId: 0,
        CreatedOn: "",
        SubjectCode: "",
        SubjectName: "",
        SubjectType: "",
        TotalCredit: 0,
        TheoryCredit: 0,
        PracticeCredit: 0,
        SchoolId: 0,
        TeacherFullname: "",
        TeacherPhone: "",
        TeacherIntro: null,
        SchoolCode: "",
        SchoolName: "",
        LogoUrl: "",
    };
    courseAssignments: any = [];
    onlineTests: any = [];
    subUrl: string = "";
    subUrlGit: string = "";
    assignmentDetail: any = {
        assignment: null,
        scoreConfig: null,
        submission: null,
        score:null
    };
    submissionInfo: any = {
        subType: {
            value: '',
            displayAs: '',
        },
        submissions: {
            data: [],
            totalRecords: 0,
            page: 1,
            size: 5,
            totalPages: 0,
        },
        users: []
    };
    subAssign: any = {
        name: '',
        id: 0
    };
    constructor(
        private router: Router,
        private proStudent: StudentProvider,
        private toastr: ToastrService,
        private proFile: FileProvider
    ) { }

    ngOnInit() {
        this.getCurUser();
        this.getCurClass();
    }

    getCurUser() {
        let t = Token.getUser();
        //console.log(t);
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


    getCurClass() {
        let t = Token.getCurCls();
        //console.log(t);
        if (t == null) {
            this.curClass = {
                ClassId: 0,
                ClassCode: "",
                ClassName: "",
                SubjectId: 0,
                Venue: "",
                Description: "",
                Images: "",
                Semester: 0,
                SchoolYear: "",
                TotalSession: 20,
                Note: "",
                Status: 0,
                TeacherId: 0,
                CreatedOn: "",
                SubjectCode: "",
                SubjectName: "",
                SubjectType: "",
                TotalCredit: 0,
                TheoryCredit: 0,
                PracticeCredit: 0,
                SchoolId: 0,
                TeacherFullname: "",
                TeacherPhone: "",
                TeacherIntro: null,
                SchoolCode: "",
                SchoolName: "",
                LogoUrl: "",
            }
        }
        else {
            this.curClass = t;
            this.loadCourseAssignments();
        }
        if (this.curClass.ClassId == 0) {
            this.router.navigate(['/transfer']);
        }
    }

    loadCourseAssignments() {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.ClassId,
            userId: this.curUser.id,
            page: 0,
            size: 0
        };

        this.proStudent.loadCourseAssignment(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                this.courseAssignments = rsp.data.normal;
                this.onlineTests = rsp.data.onlineTest;
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToast(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }


    collapsed(event: any): void {
        // console.log(event);
    }

    expanded(event: any): void {
        // console.log(event);
    }

    public dropped(files: NgxFileDropEntry[]) {
        this.files = files;
        for (const droppedFile of files) {

            // Is it a file?
            if (droppedFile.fileEntry.isFile) {
                const fileEntry = droppedFile.fileEntry as FileSystemFileEntry;
                fileEntry.file((file: File) => {

                    // Here you can access the real file
                    //console.log(droppedFile.relativePath,file);
                    //this.sFiles.push(file);

                    /**
                    // You could upload it like this:
                    const formData = new FormData()
                    formData.append('logo', file, relativePath)
           
                    // Headers
                    const headers = new HttpHeaders({
                      'security-token': 'mytoken'
                    })
           
                    this.http.post('https://mybackend.com/api/upload/sanitize-and-save-logo', formData, { headers: headers, responseType: 'blob' })
                    .subscribe(data => {
                      // Sanitized logo returned from backend
                    })
                    **/

                });
            } else {
                // It was a directory (empty directories are added, otherwise only files)
                const fileEntry = droppedFile.fileEntry as FileSystemDirectoryEntry;
                console.log(droppedFile.relativePath, fileEntry);
            }
        }
    }

    uploadDocument() {
        const formData = new FormData();
        let chkStr = "";
        for (const droppedFile of this.files) {
            // Is it a file?
            if (droppedFile.fileEntry.isFile) {
                const fileEntry = droppedFile.fileEntry as FileSystemFileEntry;
                fileEntry.file((file: File) => {
                    if (/\.(pdf|doc|docx|xls|xlsx|xlsm|ppt|pptx|pps|txt|bmp|png|jpg|jpeg|zip|rar|7z|tar)$/i.test(file.name) === false) {
                        chkStr = chkStr + "File [" + file.name + "] không đúng định dạng! ";
                    }
                    // Here you can access the real file
                    console.log(droppedFile.relativePath, file);
                    formData.append('files', file);
                    // You could upload it like this:
                });
            } else {
                // It was a directory (empty directories are added, otherwise only files)
                const fileEntry = droppedFile.fileEntry as FileSystemDirectoryEntry;
                console.log(droppedFile.relativePath, fileEntry);
            }
        }

        formData.append('UserId', this.curUser.id);
        formData.append('AssignmentId', this.subAssign.id);
        formData.append('Size', this.size.toString());

        // Headers
        let token = '';
        token = Token.getToken();
        let t = new HttpHeaders().set('Authorization', token);
        //t = t.append('Content-Type', 'multipart/form-data');

        if (chkStr == "") {
            Utils.showSpinner(true);
            this.proStudent.uploadStudentAssignment(formData)
                .subscribe((rsp: any) => {
                    if (rsp.success) {
                        console.log(rsp.data);
                        this.submissionInfo.submissions = rsp.data.submissions;
                        for (var i = 0; i < this.courseAssignments.length; i++) {
                            if (this.courseAssignments[i].id == this.subAssign.id) {
                                this.courseAssignments[i].submissionStatus = "Đã nộp";
                                break;
                            }
                        }
                        this.files = [];
                        this.showToastSuccess("Đã nộp bài thành công !");
                    } else {
                        this.message = rsp.message;
                    }
                    Utils.showSpinner(false);
                    if (this.message !== '') {
                        this.showToast(this.message);
                    }
                }, err => {
                    Utils.log(err);
                    Utils.showSpinner(false);
                });
        }
        else {
            this.showToast(chkStr);
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

    saveAssignmentSubmission(git) {
        var url = "";
        if (git) {
            url = this.subUrlGit;
        }
        else {
            url = this.subUrl;
        }
        if (this.validURL(url)) {
            Utils.showSpinner(true);
           
            let x = {
                submissionUrl: url,
                ClassAssignmentId: this.subAssign.id,
                userId: this.curUser.id,
                page: 0,
                size: this.size
            };

            this.proStudent.saveAssignmentSubmission(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    console.log(rsp.data);
                    this.submissionInfo.submissions = rsp.data;
                    for (var i = 0; i < this.courseAssignments.length; i++) {
                        if (this.courseAssignments[i].id == this.subAssign.id) {
                            this.courseAssignments[i].submissionStatus = "Đã nộp";
                            break;
                        }
                    }
                    this.showToastSuccess("Bạn đã nộp [link] bài tập thành công !");
                    if (git) {
                        this.subUrlGit="";
                    }
                    else {
                        this.subUrl="";
                    }
                } else {
                    this.message = rsp.message;
                }

                Utils.showSpinner(false);

                if (this.message !== '') {
                    this.showToast(this.message);
                }
            }, err => {
                Utils.log(err);
                Utils.showSpinner(false);
            });
        }
        else {
            this.showToastError("Đường [link] bạn nhập không hợp lệ!");
        }
    }

    showAssignmentDetail(id) {
        Utils.showSpinner(true);

        let x = {
            assignmentId: id,
            userId: this.curUser.id,
            page: 0,
            size: 0
        };

        this.proStudent.loadCourseAssignmentDetail(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                this.assignmentDetail = rsp.data;
                this.infoModal.show();
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToast(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    downloadAssignment() {
        let item: any = this.assignmentDetail.assignment;

        var dot = item.assignmentUrl.indexOf(".");
        var ext = item.assignmentUrl.substr(dot, item.assignmentUrl.length);
        //console.log(item.assignmentType +`_`+item.id+ext);
        this.proFile.download(item.assignmentUrl).subscribe(data => saveAs(data, item.assignmentType + `_` + item.id + ext));
    }

    openUploadModal(id) {
        this.subUrlGit = "";
        this.subUrl = "";
        var arr1 = this.courseAssignments.filter(d => d.id == id);
        this.subAssign = arr1[0];
        console.log(this.subAssign);
        Utils.showSpinner(true);

        let x = {
            assignmentId: id,
            userId: this.curUser.id,
            page: 1,
            size: this.size
        };

        this.proStudent.loadAssignmentSubmission(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                this.submissionInfo = rsp.data;
                let config:any = {
                    backdrop: true,
                    ignoreBackdropClick: true
                };
                this.uploadModal.config = config;
                this.uploadModal.show();
                this.clearFiles();
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToast(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    loadAssignmentSubmissionPrev() {
        let curPage = this.submissionInfo.submissions.page;
        let prevPage = curPage - 1;
        if (curPage <= 1) {
            this.toastr.error('Không còn dữ liệu', 'Bạn đang ở trang đầu tiên, không thể tìm kiếm nữa!', {
                timeOut: 3000,
                closeButton: true,
                progressBar: true
            });
        }
        else {
            Utils.showSpinner(true);
            let x = {
                assignmentId: this.subAssign.id,
                userId: this.curUser.id,
                page: prevPage,
                size: this.size
            };

            this.proStudent.loadAssignmentSubmissionNext(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.submissionInfo.submissions = rsp.data;
                } else {
                    this.message = rsp.message;
                }
                Utils.showSpinner(false);
            }, err => {
                Utils.log(err);
                Utils.showSpinner(false);
            });
        }
    }

    loadAssignmentSubmissionNext() {
        let curPage = this.submissionInfo.submissions.page;
        let nextPage = curPage + 1;
        let totPage = this.submissionInfo.submissions.totalPages;
        if (curPage >= totPage) {
            this.toastr.error('Không còn dữ liệu', 'Bạn đang ở trang cuối cùng, không thể tìm kiếm nữa!', {
                timeOut: 3000,
                closeButton: true,
                progressBar: true
            });
        }
        else {
            Utils.showSpinner(true);
            let x = {
                assignmentId: this.subAssign.id,
                userId: this.curUser.id,
                page: nextPage,
                size: this.size
            };

            this.proStudent.loadAssignmentSubmissionNext(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.submissionInfo.submissions = rsp.data;
                } else {
                    this.message = rsp.message;
                }
                Utils.showSpinner(false);
            }, err => {
                Utils.log(err);
                Utils.showSpinner(false);
            });
        }
    }

    doTestOnline(assignId)
    {
        this.router.navigate(['/student-test', { id: assignId, foo: 'foo' }]);
    }

    showToast(info) {
        this.toastr.error(info, 'Thông báo !', {
            timeOut: 4000,
            closeButton: true,
            progressBar: true,
        });
    }

    showToastSuccess(info) {
        this.toastr.success(info, 'Thông báo !', {
            timeOut: 4000,
            positionClass: 'toast-top-center',
            closeButton: true,
            progressBar: true,
        });
    }

    showToastError(info) {
        this.toastr.warning(info, 'Thông báo !', {
            timeOut: 3000,
            positionClass: 'toast-top-center',
            closeButton: true,
            progressBar: true,
        });
    }

    formatDate(str) {
        return moment(str).format('D MMMM YYYY HH:mm');
    }
    formatDate1(str) {
        return moment(str).format('DD-MM-YYYY HH:mm');
    }
    formatDate2(str) {
        return moment(str).format('DD/MM/YYYY');
    }

    checkDueDate(str) {
        return moment().isBefore(str);
    }

    deleteFile(i) {
        this.files.splice(i, 1);
    }

    public fileOver(event) {
        console.log('fileOver...');
        console.log(event);
    }

    public fileLeave(event) {
        console.log('fileLeave...');
        console.log(event);
    }

    public clearFiles() {
        this.files = [];
    }

    public validURL(str) {
        var res = str.match(/(http(s)?:\/\/.)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/g);
        return (res !== null)
    }
}

import { Component, OnInit } from '@angular/core';
import { NgxFileDropEntry, FileSystemFileEntry, FileSystemDirectoryEntry } from 'ngx-file-drop';
import { HttpHeaders  } from '@angular/common/http';
import { Utils, Token } from '../../utilities';
import { GradStudentProvider, FileProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { saveAs } from 'file-saver';
import * as moment from 'moment';

@Component({
    selector: 'app-thesis-student-work',
    templateUrl: './thesis-student-work.component.html',
    styleUrls: ['./thesis-student-work.component.css']
})
export class ThesisStudentWorkComponent implements OnInit {
    public files: NgxFileDropEntry[] = [];
    show:boolean=false;
    curThesis: any = null;
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
    message: any = '';
    worktypes:any=[];
    worktype:string='';
    typeStr:string='';
    works: any = {
        data: [],
        totalRecords: 0,
        page: 0,
        size: 2,
        totalPages: 0,
    };
    constructor(
        private router: Router,
        private proStudent: GradStudentProvider,
        private toastr: ToastrService,
        private proFile: FileProvider,
    ) { }

    ngOnInit(): void {
        this.getCurUser();
        this.getCurThesis();
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

    getCurThesis() {
        let t = Token.getCurThesis();
        //let role = Token.getUser();
        //let right = Token.righ
        //console.log(role);
        console.log(t);
        if (t == null) {
            this.curThesis = null;
        }
        else {
            this.curThesis = t;
            this.getStudentWorkType();
        }
        if (this.curThesis == null) {
            this.router.navigate(['/transfer']);
        }
    }

    getStudentWorkType()
    {
        Utils.showSpinner(true);
        let x = {
            Type: this.curThesis.ThesisType,
            userId: this.curUser.id,
            Size: 0
        };

        this.proStudent.getStudentWorkType(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.worktypes = rsp.data;
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

    public dropped(files: NgxFileDropEntry[]) {
        this.files = files;
        for (const droppedFile of files) {

            // Is it a file?
            if (droppedFile.fileEntry.isFile) {
                const fileEntry = droppedFile.fileEntry as FileSystemFileEntry;
                fileEntry.file((file: File) => {

                });
            } else {
                // It was a directory (empty directories are added, otherwise only files)
                const fileEntry = droppedFile.fileEntry as FileSystemDirectoryEntry;
                console.log(droppedFile.relativePath, fileEntry);
            }
        }
    }

    showToastSuccess(info) {
        this.toastr.success(info, 'Thông báo !', {
            timeOut: 4000,
            positionClass: 'toast-top-center',
            closeButton: true,
            progressBar: true,
        });
    }

    formatDate(str) {
        return moment(str).format('D-MMM-YYYY HH:mm');
    }

    showToastError(info) {
        this.toastr.warning(info, 'Thông báo !', {
            timeOut: 3000,
            positionClass: 'toast-top-center',
            closeButton: true,
            progressBar: true,
        });
    }

    changeType(e)
    {
        if(e.target.value!="")
        {
            this.show = true;
            console.log(e.target.value);
            var index = parseInt(e.target.value);
            var type = this.worktypes[index];
            this.typeStr = type.displayAs;
            this.worktype =  type.value;
            this.getThesisWorks(1, type.value);
        }
        else
        {
            this.show = false;
        }
    }

    getThesisWorks(cPage, val)
    {
        Utils.showSpinner(true);
        let x = {
            thesisId: this.curThesis.ThesisId,
            type: val,
            userId: this.curUser.id,
            page: cPage,
            size: this.size
        };
        this.proStudent.getThesisWorks(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                this.works = rsp.data;
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

        formData.append('ThesisId', this.curThesis.ThesisId);
        formData.append('UserId', this.curUser.id);
        formData.append('WorkType', this.worktype);
        formData.append('Size', this.size.toString());

        // Headers
        let token = '';
        token = Token.getToken();
        //let t = new HttpHeaders().set('Authorization', token);
        //t = t.append('Content-Type', 'multipart/form-data');

        if (chkStr == "") {
            Utils.showSpinner(true);
            this.proStudent.uploadThesisWork(formData)
                .subscribe((rsp: any) => {
                    if (rsp.success) {
                        console.log(rsp.data);
                        this.works= rsp.data.works;
                        this.files = [];
                        this.showToastSuccess("Đã nộp bài thành công !");
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

    pageChanged(event: any): void {
        console.log('Page changed to: ' + event.page);
        console.log('Number items per page: ' + event.itemsPerPage);
        this.getThesisWorks(event.page, this.worktype);
    }

    getSTT(i) {
        var page = this.works.page;
        var stt = (page - 1) * this.size;
        stt = stt + i + 1;
        return stt;
    }

    deleteFile(i) {
        this.files.splice(i, 1);
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

}

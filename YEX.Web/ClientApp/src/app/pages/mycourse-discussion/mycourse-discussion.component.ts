import { Component, OnInit, Renderer2, ViewChild, ElementRef  } from '@angular/core';
import { Utils, Token } from '../../utilities';
import { StudentProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    selector: 'app-mycourse-discussion',
    templateUrl: './mycourse-discussion.component.html',
    styleUrls: ['./mycourse-discussion.component.scss']
})
export class MycourseDiscussionComponent implements OnInit {
    @ViewChild('div',{static:false}) div: ElementRef;
    cmtStr:string='';
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
    courseDiscussions: any = {
        data: [],
        totalRecords: 0,
        page: 0,
        size: 5,
        totalPages: 0,
    };
    constructor(
        private router: Router,
        private proStudent: StudentProvider,
        private toastr: ToastrService,
        private renderer: Renderer2
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
            this.loadCourseDiscussion();
        }
        if (this.curClass.ClassId == 0) {
            this.router.navigate(['/transfer']);
        }
    }

    loadCourseDiscussion() {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.ClassId,
            page: 1,
            size: this.size
        };

        this.proStudent.loadCourseDiscussion(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                this.courseDiscussions = rsp.data;
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

    loadMoreDiscuss()
    {
        var curPage = this.courseDiscussions.page;
        var nextPage =  curPage + 1;
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.ClassId,
            page: nextPage,
            size: this.size
        };

        this.proStudent.loadCourseDiscussion(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                //this.courseDiscussions. = rsp.data;
                this.courseDiscussions.page = nextPage;
                for(var i =0; i < rsp.data.data.length; i++)
                {
                    this.courseDiscussions.data.push(rsp.data.data[i]);
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

    loadMoreSubDiscuss(id, index)
    {
        var curPage = this.courseDiscussions.data[index].subComments.page;
        var nextPage =  curPage + 1;
        Utils.showSpinner(true);

        let x = {
            parentId:id,
            classId: this.curClass.ClassId,
            page: nextPage,
            size: this.size
        };

        this.proStudent.loadCourseDiscussionSub(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                this.courseDiscussions.data[index].subComments.page = nextPage;
                for(var i =0; i < rsp.data.data.length; i++)
                {
                    this.courseDiscussions.data[index].subComments.data.push(rsp.data.data[i]);
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

    clearDiscussion() { 
        this.cmtStr='';
    }

    onEnter(event: any, id, index)
    {
        console.log(event.target.value, id, index);
        this.addDiscussion(2, id, index, event.target.value) ;
        event.target.value='';
    }

    addDiscussion(level, pid, index, content) { 
        console.log(this.cmtStr);
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.ClassId,
            level: level,
            parentId:pid,
            content: (content==null)?this.cmtStr:content,
            userId:this.curUser.id
        };

        this.proStudent.addDiscussion(x).subscribe((rsp: any) => {
            if (rsp.success) {
                console.log(rsp.data);
                if(level == 1)
                {
                    this.courseDiscussions.data.unshift(rsp.data);
                }
                else
                {
                    console.log(this.courseDiscussions.data[index].subComments);
                    if(this.courseDiscussions.data[index].subComments.totalRecords > 0)
                    {    
                        this.courseDiscussions.data[index].subComments.data.unshift(rsp.data);
                    }
                    else
                    {
                        var tot = this.courseDiscussions.data[index].subComments.totalRecords;
                        this.courseDiscussions.data[index].subComments.totalRecords = tot + 1;
                        this.courseDiscussions.data[index].subComments.data.push(rsp.data);
                    }
                }
                this.clearDiscussion();
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

    

    addElement() {
        const d: HTMLDivElement = this.renderer.createElement('div');
        d.setAttribute('class','comment_input');
        d.innerHTML = '<input class="form-control input1" style="margin-left: 65px;margin-bottom: 4px;" size="11" type="text"/>';
        this.renderer.appendChild(this.div.nativeElement, d)
    }

    showReply(id)
    {
        const d: HTMLInputElement = document.getElementById('comment_'+id) as HTMLInputElement;
        //console.log(d.style.display);
        if(d.style.display != 'inline')
            d.style.display = 'inline';
        else
            d.style.display = 'none';
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
        return moment(str).format('D-MMMM-YYYY');
    }
    formatTime(str) {
        return moment(str).format('HH:mm');
    }

    checkDueDate(str) {
        return moment().isBefore(str);
    }

}

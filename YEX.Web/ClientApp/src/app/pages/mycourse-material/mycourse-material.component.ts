import { Component, ViewChild, OnInit } from '@angular/core';
import { Utils, Token } from '../../utilities';
import { StudentProvider, FileProvider } from '../../providers';
import { Router } from '@angular/router';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { ToastrService } from 'ngx-toastr';
import { saveAs } from 'file-saver';
import * as moment from 'moment';


@Component({
    selector: 'app-mycourse-material',
    templateUrl: './mycourse-material.component.html',
    styleUrls: ['./mycourse-material.component.css']
})
export class MycourseMaterialComponent implements OnInit {
    @ViewChild('infoModal', { static: false }) public infoModal: ModalDirective;
    isCollapsed: boolean = false;
    message: string = "";
   
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
    courseMaterials: any = {
        materials: [],
        baiGiang: [],
        baiTap: [],
        sourceCode: []
    };
    doc:string='';
    curDoc:any={
        title:'',
        description:''
    };
    constructor(
        private router: Router,
        private proStudent: StudentProvider,
        private toastr: ToastrService,
        private proFile: FileProvider,
    ) { }

    ngOnInit() {
        this.getCurClass();
    }


    getCurClass() {
        let t = Token.getCurCls();
        console.log(t);
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
            this.loadCourseMaterials();
        }
        if (this.curClass.ClassId == 0) {
            this.router.navigate(['/transfer']);
        }
    }

    loadCourseMaterials() {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.ClassId,
            Page: 0,
            Size: 0
        };

        this.proStudent.loadCourseMaterial(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.courseMaterials = rsp.data;
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

    downloadMaterial(id, type) {
        let item:any = {};
        if(type =="materials")
        {
            var arr1 = this.courseMaterials.materials.filter(d => d.id == id);
            item = arr1[0];
        }
        if(type =="baigiang")
        {
            var arr1 = this.courseMaterials.baiGiang.filter(d => d.id == id);
            item = arr1[0];
        }
        if(type =="baitap")
        {
            var arr1 = this.courseMaterials.baiTap.filter(d => d.id == id);
            item = arr1[0];
        }
        if(type =="code")
        {
            var arr1 = this.courseMaterials.sourceCode.filter(d => d.id == id);
            item = arr1[0];
        }
        var dot = item.linkUrl.indexOf(".");
        var ext= item.linkUrl.substr(dot, item.linkUrl.length);
        //console.log(item.documentType +`_`+id+ext);
        this.proFile.download(item.linkUrl).subscribe(data => saveAs(data, item.documentType +`_`+id+ext));
    }

    showInfo(id, type)
    {
        let item:any = {};
        if(type =="materials")
        {
            var arr1 = this.courseMaterials.materials.filter(d => d.id == id);
            item = arr1[0];
        }
        if(type =="baigiang")
        {
            var arr1 = this.courseMaterials.baiGiang.filter(d => d.id == id);
            item = arr1[0];
        }
        if(type =="baitap")
        {
            var arr1 = this.courseMaterials.baiTap.filter(d => d.id == id);
            item = arr1[0];
        }
        if(type =="code")
        {
            var arr1 = this.courseMaterials.sourceCode.filter(d => d.id == id);
            item = arr1[0];
        }
        //console.log(item);
        //this.doc = '/../../'+item.linkUrl;getHostname()
        this.doc = this.getHostname()+'/'+item.linkUrl;
        //this.doc = 'https://file-examples.com/wp-content/uploads/2017/02/file-sample_100kB.docx';
        this.curDoc = item;
        this.infoModal.show();
        //console.log(this.doc);
    }

    collapsed(event: any): void {
        // console.log(event);
    }

    expanded(event: any): void {
        // console.log(event);
    }

    showToast(info) {
        this.toastr.error(info, 'Thông báo !', {
            timeOut: 3000,
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
    getHostname() : string {
        return window.location.origin;
    }
}

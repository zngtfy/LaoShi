import { Component, OnInit, ViewEncapsulation, ViewChild } from '@angular/core';
import { HomeProvider, FileProvider } from '../../providers';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { Utils } from '../../utilities';
import { ToastrService } from 'ngx-toastr';
import { saveAs } from 'file-saver';

@Component({
    selector: 'app-publication',
    templateUrl: './publication.component.html',
    styleUrls: ['./publication.component.css'],
    encapsulation: ViewEncapsulation.None
})
export class PublicationComponent implements OnInit {
    @ViewChild('viewModal', { static: false }) public viewModal: ModalDirective;
    curView:string ='';
    keyword: string = '';
    chkTitle: boolean = true;
    chkCoAuthors: boolean = false;
    chkKeywords: boolean = false;
    size: number = 5;
    message: any = '';
    TeacherPublication: any = {
        data: [],
        totalRecords: 0,
        page: 0,
        size: 5,
        totalPages: 0,
    };

    public pageSize = 5;
    public pager: any = {};
    public pagedItems: any[];
    public total: number = 0;
    public data = [];
    public setting = {};

    constructor(
        private proHome: HomeProvider,
        private proFile: FileProvider,
        private toastr: ToastrService
    ) { }

    ngOnInit() {

    }

    searchPublication() {
        Utils.showSpinner(true);
        let x = {
            id: 1,
            type: "",
            keyword: this.keyword,
            page: 1,
            size: this.size
        };

        //console.log(x);

        this.proHome.getTeacherResearchWork(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.TeacherPublication = rsp.data;
                //console.log(rsp.data);
            } else {
                this.message = rsp.message;
            }
            Utils.showSpinner(false);
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    loadNextPublication() {
        let curPage = this.TeacherPublication.page;
        let nextPage = curPage + 1;
        let totPage = this.TeacherPublication.totalPages;
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
                id: 1,
                type: "",
                page: nextPage,
                size: this.size
            };

            this.proHome.getTeacherResearchWork(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.TeacherPublication = rsp.data;
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

    loadPrevPublication() {
        let curPage = this.TeacherPublication.page;
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
                id: 1,
                type: "",
                page: prevPage,
                size: this.size
            };

            this.proHome.getTeacherResearchWork(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.TeacherPublication = rsp.data;
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

    viewPublication(id) {
        var arr1 = this.TeacherPublication.data.filter(d => d.id == id);
        var item = arr1[0];
        this.curView =item.downloadUrl;
        this.viewModal.show();
    }

    downloadPublication(id) {
        var arr1 = this.TeacherPublication.data.filter(d => d.id == id);
        //console.log('arr1', arr1);
        var item = arr1[0];
        this.proFile.download(item.downloadUrl).subscribe(data => saveAs(data, `publication_`+id+`.pdf`));
    }
}

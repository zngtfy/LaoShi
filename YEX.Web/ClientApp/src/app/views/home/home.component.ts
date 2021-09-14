import { Component, ViewChild, OnInit, OnDestroy } from "@angular/core";
import { CarouselConfig } from 'ngx-bootstrap/carousel';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { HomeProvider } from '../../providers';
import { Utils } from '../../utilities';
import { ToastrService } from 'ngx-toastr';
import * as moment from 'moment';

@Component({
    selector: 'app-home',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.css'],
    providers: [
        { provide: CarouselConfig, useValue: { interval: 1500, noPause: false } },
    ]
})
export class HomeComponent implements OnDestroy, OnInit {
    size: number = 4;
    message: string = "";
    @ViewChild('newsModal', { static: false }) public newsModal: ModalDirective;
    banners: any = [
        {
            id: 1,
            value: '/assets/img/slide/92.png',
            displayAs: '<h1 class="display-5 font-weight-normal">Slide 1</h1><p class="lead font-weight-normal">Chào mừng bạn đến với trang thông tin Hao Lee LaoShi, đây là trang thông tin về Hao Lee và là ứng dụng hỗ trợ học tập cho các bạn sinh viên, học viên!</p>'
        },
        {
            id: 2,
            value: '/assets/img/slide/91.png',
            displayAs: '<h1 class="display-5 font-weight-normal">Slide 2</h1><p class="lead font-weight-normal">Chào mừng bạn đến với trang thông tin Hao Lee LaoShi, đây là trang thông tin về Hao Lee và là ứng dụng hỗ trợ học tập cho các bạn sinh viên, học viên!</p>'
        },
        {
            id: 3,
            value: '/assets/img/slide/90.png',
            displayAs: '<h1 class="display-5 font-weight-normal">Slide 3</h1><p class="lead font-weight-normal">Chào mừng bạn đến với trang thông tin Hao Lee LaoShi, đây là trang thông tin về Hao Lee và là ứng dụng hỗ trợ học tập cho các bạn sinh viên, học viên!</p>'
        }
    ];
    firstNews: any = {};
    newss: any = {
        data: [
            {
                "id": 11,
                "group": null,
                "title": "Happy Women day ",
                "brief": "Happy Women day  2019",
                "category": "Company",
                "newsType": "Internal",
                "content": "Celebrate International Women’s Day with these empowering Happy Women’s Day quotes. International Women’s Day or IWD is remembered all around the world every March 8. It’s also celebrated on August 9th each year in South Africa under the name National Women’s Day as a public holiday. It is the celebration of the achievements of women all over the planet for their achievements in all aspects of society and civilization including social, economic, cultural and political arenas.\r\n\r\nIn some countries, IWD is celebrated as a day of appreciation much like Mother’s Day. For other countries, however, International Women’s Day is a day which highlights the political and human rights struggles of women worldwide.",
                "imgUrl": "assets/img/news/news02.jpg",
                "thumbnail": "assets/img/news/news02.jpg",
                "createdBy": 1,
                "createdOn": "2019-03-08T00:00:00",
                "newsBy": 1,
                "categoryName": "Compamy News",
                "newsTypeName": "Company Internal",
                "createdByName": "Hao Lee"
            },
            {
                "id": 12,
                "group": null,
                "title": "Thank you",
                "brief": "Thank you",
                "category": "Company",
                "newsType": "Internal",
                "content": "The dinner is open to all past pupils of Terenure College no matter what year you have left the College.\r\nWhile any past pupil is welcome to attend the dinner any year it is the common practice that year groups attend in five year cycles with the pupils leaving this year for example enjoying their first annual re union dinner five years from now and then repeating thereafter every five years. It is also typical that a number of co coordinators from each year group work to publicise the dinner with their fellow past pupils to generate support and ensure a successful dinner for that year group attending. Details of the co coordinators are also posted on the website well in advance of the dinner.\r\n\r\nThe President of the Past Pupils Union invites a number of guests each year. The guests include presidents of other past pupils unions, Carmelites, teaching staff from the College and friends of the College.",
                "imgUrl": "assets/img/news/news01a.jpg",
                "thumbnail": "assets/img/news/news01a.jpg",
                "createdBy": 1,
                "createdOn": "2019-02-22T18:30:00",
                "newsBy": 1,
                "categoryName": "Compamy News",
                "newsTypeName": "Company Internal",
                "createdByName": "Hao Lee"
            }
        ],
        totalRecords: 13,
        page: 1,
        size: 2,
        totalPages: 7
    };
    detailNews: any = {
        id: 12,
        group: null,
        title: "Thank you",
        brief: "Thank you",
        category: "Company",
        newsType: "Internal",
        content: "The dinner is open to all past pupils of Terenure College no matter what year you have left the College.\r\nWhile any past pupil is welcome to attend the dinner any year it is the common practice that year groups attend in five year cycles with the pupils leaving this year for example enjoying their first annual re union dinner five years from now and then repeating thereafter every five years. It is also typical that a number of co coordinators from each year group work to publicise the dinner with their fellow past pupils to generate support and ensure a successful dinner for that year group attending. Details of the co coordinators are also posted on the website well in advance of the dinner.\r\n\r\nThe President of the Past Pupils Union invites a number of guests each year. The guests include presidents of other past pupils unions, Carmelites, teaching staff from the College and friends of the College.",
        imgUrl: "assets/img/news/news01a.jpg",
        thumbnail: "assets/img/news/news01a.jpg",
        createdBy: 1,
        createdOn: "2019-02-22T18:30:00",
        newsBy: 1,
        categoryName: "Compamy News",
        newsTypeName: "Company Internal",
        createdByName: "Hao Lee"
    };
    myInterval: number | false = 6000;
    slides: any[] = [];
    activeSlideIndex: number = 0;
    noWrapSlides: boolean = false;

    constructor(
        private pro: HomeProvider,
        private toastr: ToastrService
    ) {
    }

    ngOnInit() {
        //this.banners 
        this.loadFirstEnter();
    }

    ngOnDestroy(): void {
        this.myInterval = 0;
        this.noWrapSlides = true;
        this.myInterval = false;
    }

    loadFirstEnter() {
        Utils.showSpinner(true);
        let x = {
            page: 1,
            size: this.size
        };

        this.pro.loadFirstEnter(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.banners = rsp.data.lsBanner;
                this.newss = rsp.data.lsNews;
                if (rsp.data.lsNews.data.length > 0) {
                    this.firstNews = rsp.data.lsNews.data[0];
                }
            } else {
                this.message = rsp.message;
            }
            Utils.showSpinner(false);
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    showToast(info) {
        this.toastr.error(info, 'Thông báo !', {
            timeOut: 3000,
            closeButton: true,
            progressBar: true,
        });
    }

    loadNextNews() {
        let curPage = this.newss.page;
        let nextPage = curPage + 1;
        let totPage = this.newss.totalPages;
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
                page: nextPage,
                size: this.size
            };

            this.pro.loadMoreNews(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.newss = rsp.data;
                    if (rsp.data.data.length > 0) {
                        this.firstNews = rsp.data.data[0];
                    }
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

    loadPrevNews() {
        let curPage = this.newss.page;
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
                page: prevPage,
                size: this.size
            };

            this.pro.loadMoreNews(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.newss = rsp.data;
                    if (rsp.data.data.length > 0) {
                        this.firstNews = rsp.data.data[0];
                    }
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

    loadDetail(index) {
        //console.log(index);
        this.detailNews = this.newss.data[index];
        this.newsModal.show();
    }

    formatDate(str) {
        return moment(str).format('D MMMM YYYY HH:mm');
    }
}

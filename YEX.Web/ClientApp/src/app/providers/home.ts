import { Injectable } from '@angular/core';
import { ApiProvider } from '../providers/api';
import { Router } from '@angular/router';

/**
 * @author HaoLee 2020-Jan-19 11:39 (verified)
 */
@Injectable()
export class HomeProvider {
    private prefix = 'api/Home/';

    constructor(
        private api: ApiProvider,
        private rou: Router
    ) { }

    /**
     * Sign in
     * @param info
     */
    public loadFirstEnter(info: any) {
        return this.api.post(this.prefix + 'load-first-enter', info, false, false);
    }

    /**
     * Sign in
     * @param info
     */
    public loadMoreNews(info: any) {
        return this.api.post(this.prefix + 'load-more-news', info, false, false);
    }

    public getTeacherInfo(info: any) {
        return this.api.post(this.prefix + 'get-teacher-info', info, true, false);
    }

    public getTeacherEduAll(info: any) {
        return this.api.post(this.prefix + 'get-teacher-edu-all', info, true, false);
    }

    public getTeacherEdu(info: any) {
        return this.api.post(this.prefix + 'get-teacher-edu', info, true, false);
    }

    public getTeacherExp(info: any) {
        return this.api.post(this.prefix + 'get-teacher-exp', info, true, false);
    }

    public getTeacherExpAll(info: any) {
        return this.api.post(this.prefix + 'get-teacher-exp-all', info, true, false);
    }

    public getTeacherMajor(info: any) {
        return this.api.post(this.prefix + 'get-teacher-major', info, true, false);
    }

    public getTeacherSkill(info: any) {
        return this.api.post(this.prefix + 'get-teacher-skill', info, true, false);
    }

    public getTeacherStudy(info: any) {
        return this.api.post(this.prefix + 'get-teacher-study', info, false, false);
    }

    public getTeacherResearchWork(info: any) {
        return this.api.post(this.prefix + 'get-teacher-research-work', info, false, false);
    }

    public getTeacherDelegateStudent(info: any) {
        return this.api.post(this.prefix + 'get-teacher-delegate-student', info, false, false);
    }

    public getTeacherPublicProfile(info: any) {
        return this.api.post(this.prefix + 'get-teacher-public-profile', info, false, false);
    }

    public loadImageGallery(info: any) {
        return this.api.post(this.prefix + 'load-image-gallery', info, false, false);
    }

    public loadImageIntro(info: any) {
        return this.api.post(this.prefix + 'load-image-intro', info, false, false);
    }

    public loadRequestType(info: any) {
        return this.api.post(this.prefix + 'load-request-type', info, false, false);
    }

    public createNews(info: any) {
        return this.api.post(this.prefix + 'create-news', info, true, false);
    }

    public updateNews(info: any) {
        return this.api.post(this.prefix + 'update-news', info, true, false);
    }
}
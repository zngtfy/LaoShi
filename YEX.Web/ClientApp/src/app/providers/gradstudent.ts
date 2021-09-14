import { Injectable } from '@angular/core';
import { ApiProvider } from '../providers/api';
import { Router } from '@angular/router';
import { Utils, Token } from '../utilities';

/**
 * @author HaoLee 2020-Jan-19 11:39 (verified)
 */
@Injectable()
export class GradStudentProvider {
    private prefix = 'api/gradstudent/';

    constructor(
        private api: ApiProvider,
        private rou: Router
    ) { }

    public getDashboardForGradStudent(info: any) {
        return this.api.post(this.prefix + 'get-dashboard-for-grad-student', info, true, false);
    }

    public getThesisInfo(info: any) {
        return this.api.post(this.prefix + 'get-thesis-intro', info, true, false);
    }

    public getThesisDocument(info: any) {
        return this.api.post(this.prefix + 'get-thesis-doc', info, true, false);
    }

    public getStudentWorkType(info: any) {
        return this.api.post(this.prefix + 'get-student-work-type', info, true, false);
    }

    public getThesisWorks(info: any) {
        return this.api.post(this.prefix + 'get-thesis-work', info, true, false);
    }

    public downloadAttachment(info: any) {
        return this.api.download(this.prefix + 'download-attachment', info);
    }

    public uploadThesisWork(info: FormData) {
        return this.api.upload(this.prefix + 'upload-thesis-work', info);
    }

    public getThesisRef(info: any) {
        return this.api.post(this.prefix + 'get-thesis-ref', info, true, false);
    }
}
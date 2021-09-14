import { Injectable } from '@angular/core';
import { ApiProvider } from '../providers/api';
import { Router } from '@angular/router';
import { Token } from '../utilities';

/**
 * @author HaoLee 2020-Jan-19 11:39 (verified)
 */
@Injectable()
export class StudentProvider {
    private prefix = 'api/student/';

    constructor(
        private api: ApiProvider,
        private rou: Router
    ) { }

    public saveCurrentClass(curClass: string, redirect: boolean = true) {
        // console.log(token);
        Token.setCurClass(curClass);

        if (redirect) {
            this.rou.navigate(['/dashboard']);
        }
    }

    public saveCurrentThesis(curClass: string, redirect: boolean = true) {
        // console.log(token);
        Token.setCurThesis(curClass);

        if (redirect) {
            this.rou.navigate(['/dashboard-grad']);
        }
    }

    public goToClass(info: any) {
        return this.api.post(this.prefix + 'go-to-class', info, true, false);
    }

    public goToThesis(info: any) {
        return this.api.post(this.prefix + 'go-to-thesis', info, true, false);
    }

    public getDashboardForStudent(info: any) {
        return this.api.post(this.prefix + 'get-dashboard-for-student', info, true, false);
    }

    public loadMoreAnnouncement(info: any) {
        return this.api.post(this.prefix + 'load-more-annoucement', info, true, false);
    }

    public loadCurrentClass(info: any) {
        return this.api.post(this.prefix + 'load-current-class', info, true, false);
    }

    public loadCourseInfo(info: any) {
        return this.api.post(this.prefix + 'load-course-info', info, true, false);
    }

    public loadCourseStudent(info: any) {
        return this.api.post(this.prefix + 'load-course-student', info, true, false);
    }

    public loadCourseMaterial(info: any) {
        return this.api.post(this.prefix + 'load-course-material', info, true, false);
    }

    public getStudentInfo(info: any) {
        return this.api.post(this.prefix + 'get-student-info', info, true, false);
    }

    public loadCourseAssignment(info: any) {
        return this.api.post(this.prefix + 'load-course-assignment', info, true, false);
    }

    public loadCourseDiscussion(info: any) {
        return this.api.post(this.prefix + 'load-course-discussion', info, true, false);
    }

    public loadCourseDiscussionSub(info: any) {
        return this.api.post(this.prefix + 'load-course-discussion-sub', info, true, false);
    }

    public addDiscussion(info: any) {
        return this.api.post(this.prefix + 'add-discussion', info, true, false);
    }

    public loadCourseScore(info: any) {
        return this.api.post(this.prefix + 'load-course-score', info, true, false);
    }

    public loadCourseAssignmentDetail(info: any) {
        return this.api.post(this.prefix + 'load-course-assignment-detail', info, true, false);
    }

    public loadAssignmentSubmission(info: any) {
        return this.api.post(this.prefix + 'load-assignment-submission', info, true, false);
    }

    public loadAssignmentSubmissionNext(info: any) {
        return this.api.post(this.prefix + 'load-assignment-submission-next', info, true, false);
    }

    public getClassAssignmentId(info: any) {
        return this.api.post(this.prefix + 'get-course-assignment-id', info, true, false);
    }

    public uploadStudentAssignment(info: FormData) {
        return this.api.upload(this.prefix + 'upload-student-assignment', info);
    }

    public downloadAttachment(info: any) {
        return this.api.download(this.prefix + 'download-attachment', info);
    }

    public saveAssignmentSubmission(info: any) {
        return this.api.post(this.prefix + 'save-assignment-submission', info, true, false);
    }

    public getTeacherInfo(info: any) {
        return this.api.post(this.prefix + 'get-teacher-info', info, true, false);
    }

    public getClassAssignmentExam(info: any) {
        return this.api.post(this.prefix + 'get-class-assignment-exam', info, true, false);
    }

    public getQuestionAndAnserForStudent(info: any) {
        return this.api.post(this.prefix + 'get-question-and-answer-for-student', info, true, false);
    }

    public studentAnswer(info: any) {
        return this.api.post(this.prefix + 'student-answer', info, true, false);
    }
}
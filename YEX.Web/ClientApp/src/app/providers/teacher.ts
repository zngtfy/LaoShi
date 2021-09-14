import { Injectable } from '@angular/core';
import { ApiProvider } from '../providers/api';
import { Router } from '@angular/router';
//import { Utils, Token } from '../utilities';

/**
 * @author HaoLee 2020-Jan-19 11:39 (verified)
 */
@Injectable()
export class TeacherProvider {
    private prefix = 'api/teacher/';

    constructor(
        private api: ApiProvider,
        private rou: Router
    ) { }

    public getDashboardForTeacher(info: any) {
        return this.api.post(this.prefix + 'get-dashboard-for-teacher', info, true, false);
    }

    public getClassForTeacher(info: any) {
        return this.api.post(this.prefix + 'get-class-for-teacher', info, true, false);
    }

    public getThesisForTeacher(info: any) {
        return this.api.post(this.prefix + 'get-thesis-for-teacher', info, true, false);
    }

    // Teacher-Class-Info
    public getTeacherAllClass(info: any) {
        return this.api.post(this.prefix + 'get-teacher-all-class', info, true, false);
    }

    public getTeacherClassById(info: any) {
        return this.api.post(this.prefix + 'get-teacher-class-by-id', info, true, false);
    }

    public saveTeacherClassInfo(info: any) {
        return this.api.post(this.prefix + 'save-teacher-class-info', info, true, false);
    }

    public completeClassNext(info: any) {
        return this.api.post(this.prefix + 'complete-teacher-class', info, true, false);
    }

    public deleteTeacherClassSession(info: any) {
        return this.api.post(this.prefix + 'delete-teacher-class-session', info, true, false);
    }

    public completeTeacherClassSession(info: any) {
        return this.api.post(this.prefix + 'complete-teacher-class-session', info, true, false);
    }

    public createNewClassSession(info: any) {
        return this.api.post(this.prefix + 'create-teacher-class-session', info, true, false);
    }

    public saveClassSession(info: any) {
        return this.api.post(this.prefix + 'save-teacher-class-session', info, true, false);
    }

    // Score-config
    public getTeacherClassScoreConfig(info: any) {
        return this.api.post(this.prefix + 'get-teacher-class-score-config', info, true, false);
    }

    public saveTeacherClassScoreConfig(info: any) {
        return this.api.post(this.prefix + 'save-teacher-class-score-config', info, true, false);
    }

    public createNewClassScoreConfig(info: any) {
        return this.api.post(this.prefix + 'create-teacher-class-score-config', info, true, false);
    }

    public completeClassScoreConfig(info: any) {
        return this.api.post(this.prefix + 'complete-teacher-class-score-config', info, true, false);
    }

    public deleteTeacherClassScoreConfig(info: any) {
        return this.api.post(this.prefix + 'delete-teacher-class-score-config', info, true, false);
    }

    public getTeacherClassStudentScore(info: any) {
        return this.api.post(this.prefix + 'get-teacher-class-student-score', info, true, false);
    }

    public saveTeacherClassStudentScore(info: any) {
        return this.api.post(this.prefix + 'save-teacher-class-student-score', info, true, false);
    }

    /////// teacher class assignment
    public getTeacherClassAssignment(info: any) {
        return this.api.post(this.prefix + 'get-teacher-class-assignment', info, true, false);
    }

    public saveTeacherClassAssignment(info: FormData) {
        return this.api.upload(this.prefix + 'save-teacher-class-assignment', info);
    }

    public createTeacherClassAssignment(info: FormData) {
        return this.api.upload(this.prefix + 'create-teacher-class-assignment', info);
    }

    public completeClassAssignment(info: any) {
        return this.api.post(this.prefix + 'complete-teacher-class-assignment', info, true, false);
    }

    public deleteTeacherClassAssignment(info: any) {
        return this.api.post(this.prefix + 'delete-teacher-class-assignment', info, true, false);
    }

    public getTeacherClassAssignmentStudentGroup(info: any) {
        return this.api.post(this.prefix + 'get-teacher-class-assignment-studentgroup', info, true, false);
    }

    public saveTeacherClassAssignmentStudentGroup(info: any) {
        return this.api.post(this.prefix + 'save-teacher-class-assignment-studentgroup', info, true, false);
    }

    public getTeacherClassAssignmentExam(info: any) {
        return this.api.post(this.prefix + 'get-teacher-class-assignment-exam', info, true, false);
    }

    public getExamForClassAssignment(info: any) {
        return this.api.post(this.prefix + 'get-exam-for-class-assignment', info, true, false);
    }
    public saveTeacherClassAssignmentExam(info: any) {
        return this.api.post(this.prefix + 'save-teacher-class-assignment-exam', info, true, false);
    }

    //////////// Class-Assignment-Student
    public getTeacherClassStudent(info: any) {
        return this.api.post(this.prefix + 'get-teacher-class-student', info, true, false);
    }
    public getTeacherClassStudentInfo(info: any) {
        return this.api.post(this.prefix + 'get-teacher-class-student-info', info, true, false);
    }
    public checkOfficialStudentId(info: any) {
        return this.api.post(this.prefix + 'check-official-student-id-for-class', info, true, false);
    }
    public checkEmailExisted(info: any) {
        return this.api.post(this.prefix + 'check-email-existed', info, true, false);
    }
    public saveTeacherClassStudentInfo(info: any) {
        return this.api.post(this.prefix + 'save-teacher-class-student-info', info, true, false);
    }
    public createTeacherClassStudentInfo(info: any) {
        return this.api.post(this.prefix + 'create-teacher-class-student-info', info, true, false);
    }
    public saveClassStudentInfoByUpload(info: any) {
        return this.api.post(this.prefix + 'save-teacher-class-student-info-by-upload', info, true, false);
    }    
    public downloadClassStudentListFullData(info: any) {
        return this.api.download(this.prefix + 'download-class-student-list-full-data', info);
    }
    public getStudentScoreList(info: any) {
        return this.api.post(this.prefix + 'get-student-score-list', info, true, false);
    }
    public calculateStudentScore(info: any) {
        return this.api.post(this.prefix + 'calculate-student-score', info, true, false);
    }
    public deleteStudentOfClass(info: any) {
        return this.api.post(this.prefix + 'delete-student-of-classs', info, true, false);
    }
    public activateStudentAccountOfClass(info: any) {
        return this.api.post(this.prefix + 'activate-student-account-of-class', info, true, false);
    }
    public testSendEmail(info: any) {
        return this.api.post(this.prefix + 'test-send-email', info, true, false);
    }
    public getScoreConfigForClass(info: any) {
        return this.api.post(this.prefix + 'get-score-config-for-class', info, true, false);
    }
    public getReportScoreConfigForClass(info: any) {
        return this.api.post(this.prefix + 'get-report-score-config-for-class', info, true, false);
    }

    /// Check Attendance
    public getCampusOfSchool(info: any) {
        return this.api.post(this.prefix + 'get-campus-for-school', info, true, false);
    }
    public getSessionForCheckAttendance(info: any) {
        return this.api.post(this.prefix + 'get-session-for-check-attendance', info, true, false);
    }
    public completeClassSession(info: any) {
        return this.api.post(this.prefix + 'complete-class-session', info, true, false);
    }
    public loadDetailAttendanceOfStudent(info: any) {
        return this.api.post(this.prefix + 'load-detail-attandance-of-student', info, true, false);
    }
    public getTeacherClassStudentAttendance(info: any) {
        return this.api.post(this.prefix + 'get-teacher-class-student-attendance', info, true, false);
    }
    public checkAttendanceForStudent(info: any) {
        return this.api.post(this.prefix + 'check-attendance-for-student', info, true, false);
    }

    /// Class Document / materials
    public getTeacherClassDocument(info: any) {
        return this.api.post(this.prefix + 'get-teacher-class-document', info, true, false);
    }
    public saveTeacherClassDocument(info: FormData) {
        return this.api.upload(this.prefix + 'save-teacher-class-document', info);
    }
    public createTeacherClassDocument(info: FormData) {
        return this.api.upload(this.prefix + 'create-teacher-class-document', info);
    }
    public deleteTeacherClassDocument(info: any) {
        return this.api.post(this.prefix + 'delete-teacher-class-document', info, true, false);
    }

    /// Class announcement
    public getTeacherClassAnnouncement(info: any) {
        return this.api.post(this.prefix + 'get-teacher-class-announcement', info, true, false);
    }
    public createTeacherClassAnnouncement(info: any) {
        return this.api.post(this.prefix + 'create-teacher-class-announcement', info, true, false);
    }
    public saveTeacherClassAnnouncement(info: any) {
        return this.api.post(this.prefix + 'save-teacher-class-announcement', info, true, false);
    }
    public deleteTeacherClassAnnouncement(info: any) {
        return this.api.post(this.prefix + 'delete-teacher-class-announcement', info, true, false);
    }

    ///// teacher exam
    public getTeacherClassSubject(info: any) {
        return this.api.post(this.prefix + 'get-teacher-class-subject', info, true, false);
    }
    public getTeacherSubjectExamAndQuestion(info: any) {
        return this.api.post(this.prefix + 'get-teacher-subject-exam-and-question', info, true, false);
    }
    public getTeacherSubjectExam(info: any) {
        return this.api.post(this.prefix + 'get-teacher-subject-exam', info, true, false);
    }
    public getTeacherSubjectExamQuestion(info: any) {
        return this.api.post(this.prefix + 'get-teacher-subject-question', info, true, false);
    }
    public getQuestionDetail(info: any) {
        return this.api.post(this.prefix + 'get-teacher-subject-question-detail', info, true, false);
    }
    public getExamDetail(info: any) {
        return this.api.post(this.prefix + 'get-teacher-subject-exam-detail', info, true, false);
    }
    public searchQuestionForExam(info: any) {
        return this.api.post(this.prefix + 'search-question-for-exam', info, true, false);
    }
    public deleteQuestionFromExam(info: any) {
        return this.api.post(this.prefix + 'delete-question-from-exam', info, true, false);
    }
    public addQuestionForExam(info: any) {
        return this.api.post(this.prefix + 'add-question-for-exam', info, true, false);
    }
    public createTeacherClassExamInfo(info: any) {
        return this.api.post(this.prefix + 'create-teacher-class-exam-info', info, true, false);
    }
    public saveTeacherClassExamInfo(info: any) {
        return this.api.post(this.prefix + 'save-teacher-class-exam-info', info, true, false);
    }
    public deleteTeacherClassExam(info: any) {
        return this.api.post(this.prefix + 'delete-teacher-class-exam', info, true, false);
    }

    public saveTeacherExamQuestionInfo(info: any) {
        return this.api.post(this.prefix + 'save-teacher-exam-question-info', info, true, false);
    }
    public createTeacherExamQuestionInfo(info: any) {
        return this.api.post(this.prefix + 'create-teacher-exam-question-info', info, true, false);
    }
    public deleteTeacherExamQuestion(info: any) {
        return this.api.post(this.prefix + 'delete-teacher-exam-question', info, true, false);
    }
    public saveTeacherQuestionAnswers(info: any) {
        return this.api.post(this.prefix + 'save-teacher-question-answers', info, true, false);
    }
}

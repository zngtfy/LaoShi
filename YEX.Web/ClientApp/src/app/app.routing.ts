import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { Guard } from './utilities';
import { GuardAuth } from './utilities/guard-auth';

// Import Admin-Layout
import { AdminLayoutComponent } from './containers';
// Import Layout
import { LayoutComponent } from './containers';

const routes: Routes = [
    {
        path: '',
        redirectTo: 'home',
        pathMatch: 'full'
    },
    {
        path: 'sign-in',
        loadChildren: './pages/sign-in/sign-in.module#SignInModule',
        canActivate: [GuardAuth]
    },
    {
        path: 'forget-password',
        loadChildren: './pages/forget-password/forget-password.module#ForgetPasswordModule',
        canActivate: [GuardAuth]
    },
    {
        path: 'reset-password',
        loadChildren: './pages/reset-password/reset-password.module#ResetPasswordModule',
        canActivate: [GuardAuth]
    },
    {
        path: 'transfer',
        loadChildren: './pages/transfer/transfer.module#TransferModule',
        canActivate: [Guard]
    },
    {
        path: 'page-not-found',
        loadChildren: './pages/p404/p404.module#P404Module'
    },
    {
        path: '',
        component: LayoutComponent,
        data: {
            title: 'Home pages'
        },
        children: [
            {
                path: 'home',
                loadChildren: () => import('./views/home/home.module').then(m => m.HomeModule)
            },
            {
                path: 'intro',
                loadChildren: () => import('./views/introduction/introduction.module').then(m => m.IntroductionModule)
            },
            {
                path: 'study',
                loadChildren: () => import('./views/study/study.module').then(m => m.StudyModule)
            },
            {
                path: 'publication',
                loadChildren: () => import('./views/publication/publication.module').then(m => m.PublicationModule)
            },
            {
                path: 'dedicate-student',
                loadChildren: () => import('./views/dedicate-student/dedicate-student.module').then(m => m.DedicateStudentModule)
            },
            {
                path: 'contact',
                loadChildren: () => import('./views/contact/contact.module').then(m => m.ContactModule)
            },
            {
                path: 'img-gallery',
                loadChildren: () => import('./views/img-gallery/img-gallery.module').then(m => m.ImgGalleryModule)
            }
        ]
    },
    {
        path: '',
        component: AdminLayoutComponent,
        data: {
            title: 'Admin pages'
        },
        children: [
            {
                path: 'dashboard',
                loadChildren: () => import('./pages/dashboard/dashboard.module').then(m => m.DashboardModule),
                canActivate: [Guard]
            },
            {
                path: 'mycourse-intro',
                loadChildren: () => import('./pages/mycourse-intro/mycourse-intro.module').then(m => m.MycourseIntroModule),
                canActivate: [Guard]
            },
            {
                path: 'mycourse-teacher',
                loadChildren: () => import('./pages/mycourse-teacher/mycourse-teacher.module').then(m => m.MycourseTeacherModule),
                canActivate: [Guard]
            },
            {
                path: 'mycourse-student-list',
                loadChildren: () => import('./pages/mycourse-student-list/mycourse-student-list.module').then(m => m.MycourseStudentListModule),
                canActivate: [Guard]
            },
            {
                path: 'mycourse-material',
                loadChildren: () => import('./pages/mycourse-material/mycourse-material.module').then(m => m.MycourseMaterialModule),
                canActivate: [Guard]
            },
            {
                path: 'mycourse-score',
                loadChildren: () => import('./pages/mycourse-score/mycourse-score.module').then(m => m.MycourseMaterialModule),
                canActivate: [Guard]
            },
            {
                path: 'mycourse-discussion',
                loadChildren: () => import('./pages/mycourse-discussion/mycourse-discussion.module').then(m => m.MycourseDiscussionModule),
                canActivate: [Guard]
            },
            {
                path: 'mycourse-assignment',
                loadChildren: () => import('./pages/mycourse-assigment/mycourse-assigment.module').then(m => m.MycourseAssigmentModule),
                canActivate: [Guard]
            },
            {
                path: 'student-test',
                loadChildren: () => import('./pages/test/test.module').then(m => m.TestModule),
                canActivate: [Guard]
            },
            {
                path: 'user-profile',
                loadChildren: () => import('./pages/user-profile/user-profile.module').then(m => m.UserProfileModule),
                canActivate: [Guard]
            },
            {
                path: 'user-change-pass',
                loadChildren: () => import('./pages/user-change-pass/user-change-pass.module').then(m => m.UserChangePassModule),
                canActivate: [Guard]
            },
            {
                path: 'dashboard-grad',
                loadChildren: () => import('./pages/dashboard-grad/dashboard-grad.module').then(m => m.DashboardGradModule),
                canActivate: [Guard]
            },
            {
                path: 'thesis-intro',
                loadChildren: () => import('./pages/thesis-intro/thesis-intro.module').then(m => m.ThesisIntroModule),
                canActivate: [Guard]
            },
            {
                path: 'thesis-document',
                loadChildren: () => import('./pages/thesis-document/thesis-document.module').then(m => m.ThesisDocumentModule),
                canActivate: [Guard]
            },
            {
                path: 'thesis-student-work',
                loadChildren: () => import('./pages/thesis-student-work/thesis-student-work.module').then(m => m.ThesisStudentWorkModule),
                canActivate: [Guard]
            },
            {
                path: 'thesis-reference',
                loadChildren: () => import('./pages/thesis-reference/thesis-reference.module').then(m => m.ThesisReferenceModule)
                // canActivate: [Guard]
            },
            {
                path: 'thesis-discussion',
                loadChildren: () => import('./pages/thesis-discussion/thesis-discussion.module').then(m => m.ThesisDiscussionModule),
                canActivate: [Guard]
            },
            {
                path: 'dashboard-teacher',
                loadChildren: () => import('./pages/dashboard-teacher/dashboard-teacher.module').then(m => m.DashboardTeacherModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-class-info',
                loadChildren: () => import('./pages/teacher-class-info/teacher-class-info.module').then(m => m.TeacherClassInfoModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-class-score-config',
                loadChildren: () => import('./pages/teacher-class-score-config/teacher-class-score-config.module').then(m => m.TeacherClassScoreConfigModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-class-discuss',
                loadChildren: () => import('./pages/teacher-class-discuss/teacher-class-discuss.module').then(m => m.TeacherClassDiscussModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-class-assignment',
                loadChildren: () => import('./pages/teacher-class-assignment/teacher-class-assignment.module').then(m => m.TeacherClassAssignmentModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-class-student',
                loadChildren: () => import('./pages/teacher-class-student/teacher-class-student.module').then(m => m.TeacherClassStudentModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-class-attendance',
                loadChildren: () => import('./pages/teacher-class-attendance/teacher-class-attendance.module').then(m => m.TeacherClassAttendanceModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-class-document',
                loadChildren: () => import('./pages/teacher-class-document/teacher-class-document.module').then(m => m.TeacherClassDocumentModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-class-announce',
                loadChildren: () => import('./pages/teacher-class-announce/teacher-class-announce.module').then(m => m.TeacherClassAnnounceModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-exam',
                loadChildren: () => import('./pages/teacher-exam/teacher-exam.module').then(m => m.TeacherExamModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-thesis-info',
                loadChildren: () => import('./pages/teacher-thesis-info/teacher-thesis-info.module').then(m => m.TeacherThesisInfoModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-thesis-doc',
                loadChildren: () => import('./pages/teacher-thesis-doc/teacher-thesis-doc.module').then(m => m.TeacherThesisDocModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-thesis-work',
                loadChildren: () => import('./pages/teacher-thesis-work/teacher-thesis-work.module').then(m => m.TeacherThesisWorkModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-thesis-discussion',
                loadChildren: () => import('./pages/teacher-thesis-discussion/teacher-thesis-discussion.module').then(m => m.TeacherThesisDiscussionModule),
                canActivate: [Guard]
            },
            {
                path: 'dashboard-admin',
                loadChildren: () => import('./pages/dashboard-admin/dashboard-admin.module').then(m => m.DashboardAdminModule),
                canActivate: [Guard]
            },
            {
                path: 'user-create',
                loadChildren: () => import('./pages/user-create/user-create.module').then(m => m.UserCreateModule),
                canActivate: [Guard]
            },
            {
                path: 'user-search',
                loadChildren: () => import('./pages/user-search/user-search.module').then(m => m.UserSearchModule),
                canActivate: [Guard]
            },
            {
                path: 'user-upload-list',
                loadChildren: () => import('./pages/user-upload-list/user-upload-list.module').then(m => m.UserUploadListModule),
                canActivate: [Guard]
            },
            {
                path: 'role-create',
                loadChildren: () => import('./pages/role-create/role-create.module').then(m => m.RoleCreateModule),
                canActivate: [Guard]
            },
            {
                path: 'role-search',
                loadChildren: () => import('./pages/role-search/role-search.module').then(m => m.RoleSearchModule),
                canActivate: [Guard]
            },
            {
                path: 'group-create',
                loadChildren: () => import('./pages/group-create/group-create.module').then(m => m.GroupCreateModule),
                canActivate: [Guard]
            },
            {
                path: 'group-search',
                loadChildren: () => import('./pages/group-search/group-search.module').then(m => m.GroupSearchModule),
                canActivate: [Guard]
            },
            {
                path: 'school-create',
                loadChildren: () => import('./pages/school-create/school-create.module').then(m => m.SchoolCreateModule),
                canActivate: [Guard]
            },
            {
                path: 'school-search',
                loadChildren: () => import('./pages/school-search/school-search.module').then(m => m.SchoolSearchModule),
                canActivate: [Guard]
            },
            {
                path: 'subject-create',
                loadChildren: () => import('./pages/subject-create/subject-create.module').then(m => m.SubjectCreateModule),
                canActivate: [Guard]
            },
            {
                path: 'subject-search',
                loadChildren: () => import('./pages/subject-search/subject-search.module').then(m => m.SubjectSearchModule),
                canActivate: [Guard]
            },
            {
                path: 'class-create',
                loadChildren: () => import('./pages/class-create/class-create.module').then(m => m.ClassCreateModule),
                canActivate: [Guard]
            },
            {
                path: 'class-search',
                loadChildren: () => import('./pages/class-search/class-search.module').then(m => m.ClassSearchModule),
                canActivate: [Guard]
            },
            {
                path: 'class-report',
                loadChildren: () => import('./pages/class-report/class-report.module').then(m => m.ClassReportModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-create',
                loadChildren: () => import('./pages/teacher-create/teacher-create.module').then(m => m.TeacherCreateModule),
                canActivate: [Guard]
            },
            {
                path: 'teacher-search',
                loadChildren: () => import('./pages/teacher-search/teacher-search.module').then(m => m.TeacherSearchModule),
                canActivate: [Guard]
            },
            {
                path: 'student-create',
                loadChildren: () => import('./pages/student-create/student-create.module').then(m => m.StudentCreateModule),
                canActivate: [Guard]
            },
            {
                path: 'student-search',
                loadChildren: () => import('./pages/student-search/student-search.module').then(m => m.StudentSearchModule),
                canActivate: [Guard]
            },
            {
                path: 'request-management',
                loadChildren: () => import('./pages/request-management/request-management.module').then(m => m.RequestManagementModule),
                canActivate: [Guard]
            },
            {
                path: 'thesis-create',
                loadChildren: () => import('./pages/thesis-create/thesis-create.module').then(m => m.ThesisCreateModule),
                canActivate: [Guard]
            },
            {
                path: 'thesis-search',
                loadChildren: () => import('./pages/thesis-search/thesis-search.module').then(m => m.ThesisSearchModule),
                canActivate: [Guard]
            },
            {
                path: 'type-management',
                loadChildren: () => import('./pages/type-management/type-management.module').then(m => m.TypeManagementModule),
                canActivate: [Guard]
            },
            {
                path: 'code-management',
                loadChildren: () => import('./pages/code-management/code-management.module').then(m => m.CodeManagementModule),
                canActivate: [Guard]
            },
            {
                path: 'news-management',
                loadChildren: () => import('./pages/news-management/news-management.module').then(m => m.NewsManagementModule),
                canActivate: [Guard]
            }
        ]
    },
];

@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule]
})

export class AppRoutingModule { }
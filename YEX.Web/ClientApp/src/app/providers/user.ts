import { Injectable } from '@angular/core';
import { ApiProvider } from '../providers/api';
import { Router, ChildrenOutletContexts } from '@angular/router';
import { Utils, Token } from '../utilities';

/**
 * @author ToanNguyen 2019-Aug-19 11:39 (verified)
 */
@Injectable()
export class UserProvider {
    private timerSignOut: any;
    private prefix = 'api/User/';

    constructor(
        private api: ApiProvider,
        private rou: Router
    ) { }

    /**
     * Send request reset password
     * @param info
     */
    public sendRequestResetPassword(info: any) {
        return this.api.post(this.prefix + 'send-request-reset-password', info, false, false);
    }

    /**
     * Check request reset password
     * @param info
     */
    public checkRequestResetPassword(info: any) {
        return this.api.post(this.prefix + 'check-request-reset-password', info, false, false);
    }

    /**
     * Reset password
     * @param info
     */
    public resetPassword(info: any) {
        return this.api.post(this.prefix + 'reset-password', info, false, false);
    }

    /**
     * Check reminder token
     * @param info
     */
    public checkReminderToken(info: any) {
        return this.api.post(this.prefix + 'check-reminder-token', info, false, false);
    }

    /**
     * Get configuration
     */
    public getConfig() {
        return this.api.get(this.prefix + 'get-config', false, false);
    }

    /**
     * Get info
     * @param info
     */
    public getInfo(info: any) {
        return this.api.post(this.prefix + 'get-info', info, false, false);
    }

    /**
     * Upload info
     * @param info
     */
    public uploadInfo(info: any) {
        return this.api.post(this.prefix + 'upload-info', info, false, false);
    }

    /**
     * Change password
     * @param info
     */
    public changePass(info: any) {
        return this.api.post(this.prefix + 'change-pass', info, false, false);
    }

    /**
     * Upload avatar
     * @param info
     */
    public uploadAvatar(info: any) {
        return this.api.post(this.prefix + 'upload-avatar', info, false, false);
    }

    /**
     * Sign in
     * @param info
     */
    public signIn(info: any) {
        return this.api.post(this.prefix + 'z-auth', info, false, false);
    }

    /**
     * Sign out
     */
    public signOut() {
        // let t = this.api.post(this.prefix + 'sign-out', {}, true, false);
        // t.subscribe(() => {
        //     Token.signOut = false;
        //     Token.removeToken();
        //     this.rou.navigate(['/']);
        // }, err => Utils.log(err));
        Token.signOut = false;
        Token.removeToken();
        this.rou.navigate(['/']);
    }

    /**
    * Refresh token
    */
    public refreshToken() {
        let t = this.api.post(this.prefix + 'refresh-token', {}, true, false);
        t.subscribe((rsp: any) => {
            if (rsp.success) {
                Token.signOut = true;
                Token.setToken(rsp.result);
            }
            else {
                Utils.log(rsp.message);
            }
        }, err => Utils.log(err));
    }

    /**
     * Save authentication
     * @param token 
     * @param redirect 
     */
    public saveAuth(token: string, redirect: boolean = true) {
        if (this.timerSignOut) {
            clearInterval(this.timerSignOut);
        }
        // console.log(token);
        Token.setToken(token);

        /*this.timerSignOut = setInterval(() => {
            Utils.log('Run this.timerSignOut');

            let t = Token.runSignOut.getTime() - Token.lastAccess.getTime();
            if (t < Token.intSignOut) {
                Utils.log('Call this.refreshToken()');
                this.refreshToken();
            }
            else {
                Utils.log('Call this.signOut()');

                if (this.timerSignOut) {
                    clearInterval(this.timerSignOut);
                }

                this.signOut();
            }
        }, Token.intSignOut);*/

        if (redirect) {
            let role = Token.getUserRole();
            console.log(role);
            if (role == 'Administration')
                this.rou.navigate(['/dashboard-admin']);
            else if (role == 'Student')
                this.rou.navigate(['/transfer']);
            else if (role == 'Teacher-Assistant')
                this.rou.navigate(['/dashboard-teacher']);
            else //if (role == 'Guest')
                this.rou.navigate(['/home']);
        }
    }

    public getMenuNav() {
        let menus: any = [];
        let rights = Token.getUser().rights;
        if (rights.indexOf('S1-01') >= 0) {
            menus.push({
                name: 'Dashboard',
                url: '/dashboard',
                icon: 'icon-speedometer',
                badge: {
                    variant: 'info',
                    text: 'NEW'
                },
            });
            menus.push({
                title: true,
                name: 'Lớp của tôi'
            });
        }
        if (rights.indexOf('S1-02') >= 0) {
            menus.push({
                name: 'Giới thiệu',
                url: '/mycourse-intro',
                icon: 'icon-directions'
            });
        }
        if (rights.indexOf('S1-03') >= 0) {
            menus.push({
                name: 'Danh sách sinh viên',
                url: '/mycourse-student-list',
                icon: 'icon-list'
            });
        }
        if (rights.indexOf('S1-04') >= 0) {
            menus.push({
                name: 'Tài liệu học tập',
                url: '/mycourse-material',
                icon: 'icon-book-open'
            });
        }
        if (rights.indexOf('S1-05') >= 0) {
            menus.push({
                name: 'Bài tập',
                url: '/mycourse-assignment',
                icon: 'icon-folder'
            });
        }
        if (rights.indexOf('S1-06') >= 0) {
            menus.push({
                name: 'Điểm số',
                url: '/mycourse-score',
                icon: 'icon-graduation'
            });
        }
        if (rights.indexOf('S1-07') >= 0) {
            menus.push({
                name: 'Thảo luận',
                url: '/mycourse-discussion',
                icon: 'icon-speech'
            });
        }
        if (rights.indexOf('S1-08') >= 0) {
            menus.push({
                name: 'Về giảng viên',
                url: '/mycourse-teacher',
                icon: 'icon-emotsmile'
            });
        }

        // Thesis
        if (rights.indexOf('G0') >= 0) {
            menus.push({
                title: true,
                name: 'Luận văn của tôi'
            });
            menus.push({
                name: 'Dashboard Thesis',
                url: '/dashboard-grad',
                icon: 'icon-speedometer',
                badge: {
                    variant: 'info',
                    text: 'NEW'
                },
            });
        }
        // G1
        if (rights.indexOf('G1') >= 0) {
            menus.push({
                name: 'Giới thiệu luận văn',
                url: '/thesis-intro',
                icon: 'icon-fire'
            });
        }
        // G2
        if (rights.indexOf('G2') >= 0) {
            menus.push({
                name: 'Văn bản liên quan',
                url: '/thesis-document',
                icon: 'icon-docs'
            });
        }
        // G3
        if (rights.indexOf('G3') >= 0) {
            menus.push({
                name: 'Nộp bài',
                url: '/thesis-student-work',
                icon: 'icon-badge'
            });
        }
        // G4
        if (rights.indexOf('G4') >= 0) {
            menus.push({
                name: 'Tài liệu tham khảo',
                url: '/thesis-reference',
                icon: 'icon-folder-alt'
            });
        }
        // G5
        if (rights.indexOf('G5') >= 0) {
            menus.push({
                name: 'Thảo luận',
                url: '/thesis-discussion',
                icon: 'icon-bubbles'
            });
        }


        //////// Teacher - TA
        if (rights.indexOf('T0') >= 0) {
            menus.push({
                name: 'Dashboard-Teacher',
                url: '/dashboard-teacher',
                icon: 'icon-speedometer',
                badge: {
                    variant: 'info',
                    text: 'NEW'
                },
            });
        }
        //T1
        if (rights.indexOf('T1') >= 0) {
            menus.push({
                title: true,
                name: 'Lớp học'
            });
        }
        //T1-01
        if (rights.indexOf('T1-01') >= 0) {
            menus.push({
                name: 'Thông tin lớp học',
                url: '/teacher-class-info',
                icon: 'icon-feed'
            });
        }
        //T1-02
        if (rights.indexOf('T1-02') >= 0) {
            menus.push({
                name: 'Cài đặt điểm số',
                url: '/teacher-class-score-config',
                icon: 'icon-pie-chart'
            });
        }
        //T1-03
        if (rights.indexOf('T1-03') >= 0) {
            menus.push({
                name: 'Trao đổi lớp học',
                url: '/teacher-class-discuss',
                icon: 'icon-bubbles'
            });
        }
        //T1-04
        if (rights.indexOf('T1-04') >= 0) {
            menus.push({
                name: 'Bài tập lớp học',
                url: '/teacher-class-assignment',
                icon: 'icon-notebook'
            });
        }
        //T1-05
        if (rights.indexOf('T1-05') >= 0) {
            menus.push({
                name: 'Sinh viên của lớp',
                url: '/teacher-class-student',
                icon: 'icon-people'
            });
        }
        //T1-06
        if (rights.indexOf('T1-06') >= 0) {
            menus.push({
                name: 'Điểm danh lớp',
                url: '/teacher-class-attendance',
                icon: 'icon-note'
            });
        }
        //T1-07
        if (rights.indexOf('T1-07') >= 0) {
            menus.push({
                name: 'Tài liệu học tập',
                url: '/teacher-class-document',
                icon: 'icon-speech'
            });
        }
        //T1-08
        if (rights.indexOf('T1-08') >= 0) {
            menus.push({
                name: 'Thông báo sinh viên',
                url: '/teacher-class-announce',
                icon: 'icon-bell'
            });
        }
        //T1-09
        if (rights.indexOf('T1-09') >= 0) {
            menus.push({
                name: 'Soạn Đề thi',
                url: '/teacher-exam',
                icon: 'icon-graduation'
            });
        }

        //T2
        if (rights.indexOf('T1') >= 0) {
            menus.push({
                title: true,
                name: 'Luận văn'
            });
        }
        //T2-01
        if (rights.indexOf('T2-01') >= 0) {
            menus.push({
                name: 'Giới thiệu về luận văn',
                url: '/teacher-thesis-info',
                icon: 'icon-hourglass'
            });
        }
        //T2-02
        if (rights.indexOf('T2-02') >= 0) {
            menus.push({
                name: 'Văn bản liên quan',
                url: '/teacher-thesis-doc',
                icon: 'icon-screen-desktop'
            });
        }
        //T2-03
        if (rights.indexOf('T2-03') >= 0) {
            menus.push({
                name: 'Bài nộp HV / SV',
                url: '/teacher-thesis-work',
                icon: 'icon-trophy'
            });
        }
        //T2-04
        if (rights.indexOf('T2-04') >= 0) {
            menus.push({
                name: 'Trao đổi - thảo luận',
                url: '/teacher-thesis-discussion',
                icon: 'icon-shield'
            });
        }

        //////// Admin
        if (rights.indexOf('A0') >= 0) {
            menus.push({
                name: 'Dashboard-Admin',
                url: '/dashboard-admin',
                icon: 'icon-speedometer',
                badge: {
                    variant: 'info',
                    text: 'NEW'
                },
            });
        }

        if (rights.indexOf('A1') >= 0 || rights.indexOf('A2') >= 0 || rights.indexOf('A3') >= 0
            || rights.indexOf('A4') >= 0 || rights.indexOf('A5') >= 0 || rights.indexOf('A6') >= 0
            || rights.indexOf('A7') >= 0 || rights.indexOf('A8') >= 0 || rights.indexOf('A9') >= 0
        ) {
            menus.push({
                title: true,
                name: 'System Admin',
                variant: 'info',
            });
        }
        // Từ nhóm A1
        if (rights.indexOf('A1') >= 0) {
            let child = [];
            if (rights.indexOf('A1-01') >= 0) {
                child.push({
                    name: 'Create New User',
                    url: '/user-create',
                    icon: 'icon-user-follow'
                });
            }
            if (rights.indexOf('A1-02') >= 0) {
                child.push({
                    name: 'Search User',
                    url: '/user-search',
                    icon: 'icon-people'
                });
            }
            if (rights.indexOf('A1-03') >= 0) {
                child.push({
                    name: 'User Report',
                    url: '/user-upload-list',
                    icon: 'icon-pie-chart'
                });
            }
            menus.push({
                name: 'User management',
                url: '/user-management',
                icon: 'icon-user',
                children: child
            });
        }

        // Từ nhóm A2
        if (rights.indexOf('A2') >= 0) {
            let child = [];
            if (rights.indexOf('A2-01') >= 0) {
                child.push({
                    name: 'Create New Role',
                    url: '/role-create',
                    icon: 'icon-arrow-right'
                });
            }
            if (rights.indexOf('A2-02') >= 0) {
                child.push({
                    name: 'Search Role',
                    url: '/role-search',
                    icon: 'icon-arrow-right'
                });
            }
            menus.push({
                name: 'Role management',
                url: '/role-management',
                icon: 'icon-user',
                children: child
            });
        }

        // Từ nhóm A3
        if (rights.indexOf('A3') >= 0) {
            let child = [];
            if (rights.indexOf('A3-01') >= 0) {
                child.push({
                    name: 'Create New Group',
                    url: '/group-create',
                    icon: 'icon-arrow-right'
                });
            }
            if (rights.indexOf('A3-02') >= 0) {
                child.push({
                    name: 'Search Group',
                    url: '/group-search',
                    icon: 'icon-arrow-right'
                });
            }
            menus.push({
                name: 'Group management',
                url: '/group-management',
                icon: 'icon-puzzle',
                children: child
            });
        }

        // Từ nhóm A4
        if (rights.indexOf('A4') >= 0) {
            let child = [];
            if (rights.indexOf('A4-01') >= 0) {
                child.push({
                    name: 'Create New School',
                    url: '/school-create',
                    icon: 'icon-arrow-right'
                });
            }
            if (rights.indexOf('A4-02') >= 0) {
                child.push({
                    name: 'Search School',
                    url: '/school-search',
                    icon: 'icon-arrow-right'
                });
            }
            menus.push({
                name: 'School management',
                url: '/school-management',
                icon: 'icon-home',
                children: child
            });
        }

        // Từ nhóm A5
        if (rights.indexOf('A5') >= 0) {
            let child = [];
            if (rights.indexOf('A5-01') >= 0) {
                child.push({
                    name: 'Create New Subject',
                    url: '/subject-create',
                    icon: 'icon-arrow-right'
                });
            }
            if (rights.indexOf('A5-02') >= 0) {
                child.push({
                    name: 'Search Subject',
                    url: '/subject-search',
                    icon: 'icon-arrow-right'
                });
            }
            menus.push({
                name: 'Subject management',
                url: '/subject-management',
                icon: 'icon-grid',
                children: child
            });
        }

        // Từ nhóm A6
        if (rights.indexOf('A6') >= 0) {
            let child = [];
            if (rights.indexOf('A6-01') >= 0) {
                child.push({
                    name: 'Create New Class',
                    url: '/class-create',
                    icon: 'icon-arrow-right'
                });
            }
            if (rights.indexOf('A6-02') >= 0) {
                child.push({
                    name: 'Search Class',
                    url: '/class-search',
                    icon: 'icon-arrow-right'
                });
            }
            if (rights.indexOf('A6-03') >= 0) {
                child.push({
                    name: 'Class report',
                    url: '/class-report',
                    icon: 'icon-arrow-right'
                });
            }
            menus.push({
                name: 'Class management',
                url: '/class-management',
                icon: 'icon-heart',
                children: child
            });
        }

        // Từ nhóm A7 -- teacher
        if (rights.indexOf('A7') >= 0) {
            let child = [];
            if (rights.indexOf('A7-01') >= 0) {
                child.push({
                    name: 'Create New teacher',
                    url: '/teacher-create',
                    icon: 'icon-arrow-right'
                });
            }
            if (rights.indexOf('A7-02') >= 0) {
                child.push({
                    name: 'Search teacher',
                    url: '/teacher-search',
                    icon: 'icon-arrow-right'
                });
            }
            menus.push({
                name: 'Teacher management',
                url: '/teacher-management',
                icon: 'icon-user-following',
                children: child
            });
        }

        // Từ nhóm A11 - Student
        if (rights.indexOf('A11') >= 0) {
            let child = [];
            if (rights.indexOf('A11-01') >= 0) {
                child.push({
                    name: 'Create New student',
                    url: '/student-create',
                    icon: 'icon-arrow-right'
                });
            }
            if (rights.indexOf('A11-02') >= 0) {
                child.push({
                    name: 'Search student',
                    url: '/student-search',
                    icon: 'icon-arrow-right'
                });
            }
            menus.push({
                name: 'Student management',
                url: '/student-management',
                icon: 'icon-people',
                children: child
            });
        }

        // Từ nhóm A8 -- Thesis
        if (rights.indexOf('A8') >= 0) {
            let child = [];
            if (rights.indexOf('A8-01') >= 0) {
                child.push({
                    name: 'Create New Thesis',
                    url: '/thesis-create',
                    icon: 'icon-arrow-right'
                });
            }
            if (rights.indexOf('A8-02') >= 0) {
                child.push({
                    name: 'Thesis teacher',
                    url: '/thesis-search',
                    icon: 'icon-arrow-right'
                });
            }
            menus.push({
                name: 'Thesis Management',
                url: '/thesis-management',
                icon: 'icon-magnifier',
                children: child
            });
        }

        if (rights.indexOf('A9') >= 0) {
            menus.push({
                name: 'Request management',
                url: '/request-management',
                icon: 'icon-call-in'
            });
        }

        // Từ nhóm A10
        if (rights.indexOf('A10') >= 0) {
            let child = [];
            if (rights.indexOf('A10-01') >= 0) {
                child.push({
                    name: 'CodeType',
                    url: '/type-management',
                    icon: 'icon-arrow-right'
                });
            }
            if (rights.indexOf('A10-02') >= 0) {
                child.push({
                    name: 'Code',
                    url: '/code-management',
                    icon: 'icon-arrow-right'
                });
            }
            if (rights.indexOf('A10-03') >= 0) {
                child.push({
                    name: 'News',
                    url: '/news-management',
                    icon: 'icon-arrow-right'
                });
            }
            menus.push({
                name: 'Settings',
                icon: 'icon-settings',
                url: '/setting-management',
                children: child
            });
        }

        menus.push({
            name: 'Trang chủ',
            url: '/home',
            icon: 'icon-globe',
            class: 'mt-auto',
            variant: 'success',
            attributes: { target: '_blank', rel: 'noopener' }
        });

        return menus;
    }
}
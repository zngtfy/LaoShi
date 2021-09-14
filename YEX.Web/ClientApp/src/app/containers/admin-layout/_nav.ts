import { INavData } from '@coreui/angular';

export const navItems: INavData[] = [
    {
        name: 'Dashboard',
        url: '/dashboard',
        icon: 'icon-speedometer',
        badge: {
            variant: 'info',
            text: 'NEW'
        },
    },
    {
        title: true,
        name: 'Lớp của tôi'
    },
    {
        name: 'Giới thiệu',
        url: '/mycourse-intro',
        icon: 'icon-directions'
    },
    {
        name: 'Danh sách sinh viên',
        url: '/mycourse-student-list',
        icon: 'icon-list'
    },
    {
        name: 'Tài liệu học tập',
        url: '/mycourse-material',
        icon: 'icon-book-open'
    },
    {
        name: 'Bài tập',
        url: '/mycourse-assignment',
        icon: 'icon-folder'
    },
    {
        name: 'Điểm số',
        url: '/mycourse-score',
        icon: 'icon-graduation'
    },
    {
        name: 'Thảo luận',
        url: '/mycourse-discussion',
        icon: 'icon-speech'
    },
    {
        name: 'Về giảng viên',
        url: '/mycourse-teacher',
        icon: 'icon-emotsmile'
    },
    {
        title: true,
        name: 'System Admin'
    },
    {
        name: 'User management',
        url: '/user-management',
        icon: 'icon-user',
        children: [
            {
                name: 'Create New User',
                url: '/user-create',
                icon: 'icon-user-follow'
            },
            {
                name: 'Search User',
                url: '/user-search',
                icon: 'icon-people'
            },
            {
                name: 'User Report',
                url: 'user-report',
                icon: 'icon-pie-chart'
            }
        ]
    },
    {
        name: 'Role management',
        url: '/role-management',
        icon: 'icon-user',
        children: [
            {
                name: 'Create New Role',
                url: '/role-create',
                icon: 'icon-arrow-right'
            },
            {
                name: 'Search Role',
                url: '/role-search',
                icon: 'icon-arrow-right'
            }
        ]
    },
    {
        name: 'Group management',
        url: '/group-management',
        icon: 'icon-puzzle',
        children: [
            {
                name: 'Create New Group',
                url: '/group-create',
                icon: 'icon-arrow-right'
            },
            {
                name: 'Search Group',
                url: '/group-search',
                icon: 'icon-arrow-right'
            }
        ]
    },
    {
        name: 'School management',
        url: '/school-management',
        icon: 'icon-home',
        children: [
            {
                name: 'Create New School',
                url: '/school-create',
                icon: 'icon-arrow-right'
            },
            {
                name: 'Search School',
                url: '/school-search',
                icon: 'icon-arrow-right'
            }
        ]
    },
    {
        name: 'Subject management',
        url: '/subject-management',
        icon: 'icon-grid',
        children: [
            {
                name: 'Create New Subject',
                url: '/subject-create',
                icon: 'icon-arrow-right'
            },
            {
                name: 'Search Subject',
                url: '/subject-search',
                icon: 'icon-arrow-right'
            }
        ]
    },
    {
        name: 'Class/Course management',
        url: '/class-management',
        icon: 'icon-heart',
        children: [
            {
                name: 'Create New Class',
                url: '/class-create',
                icon: 'icon-arrow-right'
            },
            {
                name: 'Search Class',
                url: '/class-search',
                icon: 'icon-arrow-right'
            },
            {
                name: 'Class report',
                url: '/class-report',
                icon: 'icon-arrow-right'
            }
        ]
    },
    {
        name: 'Teacher management',
        url: '/teacher-management',
        icon: 'icon-magnifier',
        children: [
            {
                name: 'Create New teacher',
                url: '/teacher-create',
                icon: 'icon-arrow-right'
            },
            {
                name: 'Search teacher',
                url: '/teacher-search',
                icon: 'icon-arrow-right'
            }
        ]
    },
    {
        name: 'Trang chủ',
        url: '/home',
        icon: 'icon-globe',
        class: 'mt-auto',
        variant: 'success',
        attributes: { target: '_blank', rel: 'noopener' }
    }
];

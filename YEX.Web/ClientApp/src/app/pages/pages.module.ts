import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { PagesComponent } from './pages.component';

const routes: Routes = [
    {
        path: '',
        component: PagesComponent,
        children: [
            { path: '', redirectTo: 'dashboard', pathMatch: 'full' },
            { path: 'dashboard', loadChildren: './dashboard/dashboard.module#DashboardModule' },
            { path: 'user-search', loadChildren: './user-search/user-search.module#UserSearchModule' },
            { path: 'role-create', loadChildren: './role-create/role-create.module#RoleCreateModule' },
            { path: 'user-create', loadChildren: './user-create/user-create.module#UsercreateModule' }
        ]
    }
];

@NgModule({
    declarations: [PagesComponent],
    imports: [
        CommonModule,
        RouterModule.forChild(routes)
    ]
})

export class PagesModule { }
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { ToastrModule } from 'ngx-toastr';

import { MycourseDiscussionComponent } from './mycourse-discussion.component';

const routes: Routes = [
    { path: '', component: MycourseDiscussionComponent, pathMatch: 'full' }
];

@NgModule({
    imports: [
        FormsModule,
        CommonModule,
        ChartsModule,
        BsDropdownModule,
        ToastrModule.forRoot(),
        ButtonsModule.forRoot(),
        RouterModule.forChild(routes)
    ],
    declarations: [MycourseDiscussionComponent]
})
export class MycourseDiscussionModule { }

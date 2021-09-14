import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { ToastrModule } from 'ngx-toastr';
import { TeacherClassAnnounceComponent } from './teacher-class-announce.component';
import { PaginationModule } from 'ngx-bootstrap/pagination';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { ModalModule } from 'ngx-bootstrap/modal';
import { PopoverModule } from 'ngx-bootstrap/popover';
import { CKEditorModule } from '@ckeditor/ckeditor5-angular';

const routes: Routes = [
    { path: '', component: TeacherClassAnnounceComponent, pathMatch: 'full' }
];

@NgModule({
    imports: [
        CKEditorModule,
        FormsModule,
        ChartsModule,
        CommonModule,
        TabsModule,
        BsDropdownModule,
        ButtonsModule.forRoot(),
        ToastrModule.forRoot(),
        PaginationModule.forRoot(),
        ModalModule.forRoot(),
        PopoverModule.forRoot(),
        RouterModule.forChild(routes)
    ],
    declarations: [TeacherClassAnnounceComponent]
})
export class TeacherClassAnnounceModule { }

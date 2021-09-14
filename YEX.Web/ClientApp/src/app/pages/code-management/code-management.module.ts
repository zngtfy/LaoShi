import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { ToastrModule } from 'ngx-toastr';
import { CodeManagementComponent } from './code-management.component';
import { PaginationModule } from 'ngx-bootstrap/pagination';
import { ModalModule } from 'ngx-bootstrap';
import { CKEditorModule } from '@ckeditor/ckeditor5-angular';

const routes: Routes = [
    { path: '', component: CodeManagementComponent, pathMatch: 'full' }
];

@NgModule({
    imports: [
        CKEditorModule,
        ModalModule.forRoot(),
        FormsModule,
        ChartsModule,
        CommonModule,
        BsDropdownModule,
        ButtonsModule.forRoot(),
        ToastrModule.forRoot(),
        PaginationModule.forRoot(),
        RouterModule.forChild(routes)
    ],
    declarations: [CodeManagementComponent]
})
export class CodeManagementModule { }

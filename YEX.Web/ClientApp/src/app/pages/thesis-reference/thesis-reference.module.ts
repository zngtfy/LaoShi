import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { ToastrModule } from 'ngx-toastr';
import { ThesisReferenceComponent } from './thesis-reference.component';
import { PaginationModule } from 'ngx-bootstrap/pagination';
import { ModalModule } from 'ngx-bootstrap/modal';
import { PdfViewerModule } from 'ng2-pdf-viewer';

const routes: Routes = [
    { path: '', component: ThesisReferenceComponent, pathMatch: 'full' }
];

@NgModule({
    imports: [
        FormsModule,
        ChartsModule,
        CommonModule,
        BsDropdownModule,
        ButtonsModule.forRoot(),
        PdfViewerModule,
        ToastrModule.forRoot(),
        ModalModule.forRoot(),
        PaginationModule.forRoot(),
        RouterModule.forChild(routes)
    ],
    declarations: [ThesisReferenceComponent]
})
export class ThesisReferenceModule { }

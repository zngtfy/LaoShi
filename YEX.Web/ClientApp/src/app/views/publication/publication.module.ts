import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ModalModule } from 'ngx-bootstrap/modal';
import { PdfViewerModule } from 'ng2-pdf-viewer';

import { PublicationComponent } from './publication.component';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { ToastrModule } from 'ngx-toastr';

const routes: Routes = [
    { path: '', component: PublicationComponent, pathMatch: 'full' }
];

@NgModule({
    declarations: [PublicationComponent],
    imports: [
        CommonModule,
        FormsModule,
        Ng2SmartTableModule,
        PdfViewerModule,
        ToastrModule.forRoot(),
        ModalModule.forRoot(),
        RouterModule.forChild(routes)
    ]
})
export class PublicationModule { }
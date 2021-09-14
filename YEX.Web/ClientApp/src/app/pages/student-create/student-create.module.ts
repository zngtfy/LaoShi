import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { ToastrModule } from 'ngx-toastr';
import { StudentCreateComponent } from './student-create.component';
import { PaginationModule } from 'ngx-bootstrap/pagination';

const routes: Routes = [
    { path: '', component: StudentCreateComponent, pathMatch: 'full' }
];

@NgModule({
    imports: [
        FormsModule,
        ChartsModule,
        CommonModule,
        BsDropdownModule,
        ButtonsModule.forRoot(),
        ToastrModule.forRoot(),
        PaginationModule.forRoot(),
        RouterModule.forChild(routes)
    ],
    declarations: [StudentCreateComponent]
})
export class StudentCreateModule { }

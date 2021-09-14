import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ChartsModule } from 'ng2-charts';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ButtonsModule } from 'ngx-bootstrap/buttons';
import { ToastrModule } from 'ngx-toastr';
import { TeacherClassAttendanceComponent } from './teacher-class-attendance.component';
import { PaginationModule } from 'ngx-bootstrap/pagination';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { ModalModule } from 'ngx-bootstrap/modal';
import { PopoverModule } from 'ngx-bootstrap/popover';
import { DeviceDetectorModule } from 'ngx-device-detector';

import { AgmCoreModule, GoogleMapsAPIWrapper } from '@agm/core';

const routes: Routes = [
    { path: '', component: TeacherClassAttendanceComponent, pathMatch: 'full' }
];

@NgModule({
    imports: [
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
        DeviceDetectorModule.forRoot(),
        AgmCoreModule.forRoot({
            apiKey: 'AIzaSyCRonbZDYtiAZYHLD2n1wQ7s9S09qfam4o',
            libraries:['places']
        }),
        RouterModule.forChild(routes)
    ],
    providers: [
      GoogleMapsAPIWrapper,
    ],
    declarations: [TeacherClassAttendanceComponent]
})
export class TeacherClassAttendanceModule { }

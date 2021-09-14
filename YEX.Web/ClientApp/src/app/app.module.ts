import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { Routes, RouterModule } from '@angular/router';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { PerfectScrollbarModule } from 'ngx-perfect-scrollbar';
import { PERFECT_SCROLLBAR_CONFIG } from 'ngx-perfect-scrollbar';
import { PerfectScrollbarConfigInterface } from 'ngx-perfect-scrollbar';
import { GoogleChartsModule } from 'angular-google-charts';
import { AgmCoreModule } from '@agm/core';

const DEFAULT_PERFECT_SCROLLBAR_CONFIG: PerfectScrollbarConfigInterface = {
    suppressScrollX: true
};
import { AppComponent } from './app.component';

// Import routing module
import { AppRoutingModule } from './app.routing';

import {
    ApiProvider,
    SettingProvider,
    UserProvider,
    FileProvider,
    HomeProvider,
    StudentProvider,
    TeacherProvider,
    GradStudentProvider,
    RequestProvider,
    ExcelProvider,
    CodeTypeProvider
} from './providers';

import {
    GuardAuth,
    Guard,
    Rsa
} from './utilities';

import { AdminLayoutComponent } from './containers/admin-layout/admin-layout.component';
const APP_CONTAINERS = [
    AdminLayoutComponent
];

import {
    AppAsideModule,
    AppBreadcrumbModule,
    AppHeaderModule,
    AppFooterModule,
    AppSidebarModule,
} from '@coreui/angular';

// Import 3rd party components
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { ChartsModule } from 'ng2-charts';
import { LayoutComponent } from './containers/layout/layout.component';

import { Ng2SmartTableModule } from 'ng2-smart-table';
import { ToastrModule } from 'ngx-toastr';
import { ModalModule } from 'ngx-bootstrap';
import { FormsModule } from '@angular/forms';
import { CodeProvider } from './providers/code';

import { CKEditorModule } from '@ckeditor/ckeditor5-angular';
import { DeviceDetectorModule } from 'ngx-device-detector';
import { AutocompleteLibModule } from 'angular-ng-autocomplete';

@NgModule({
    declarations: [
        AppComponent,
        AdminLayoutComponent,
        ...APP_CONTAINERS,
        LayoutComponent
    ],
    imports: [
        CKEditorModule,
        FormsModule,
        ModalModule.forRoot(),
        BrowserModule,
        HttpClientModule,
        BrowserAnimationsModule,
        AppRoutingModule,
        AppAsideModule,
        AppBreadcrumbModule.forRoot(),
        AppFooterModule,
        AppHeaderModule,
        AppSidebarModule,
        PerfectScrollbarModule,
        BsDropdownModule.forRoot(),
        TabsModule.forRoot(),
        DeviceDetectorModule.forRoot(),
        ToastrModule.forRoot({
            timeOut: 10000,
            positionClass: 'toast-top-right',
            preventDuplicates: true,
        }),
        ChartsModule,
        Ng2SmartTableModule,
        GoogleChartsModule,
        AutocompleteLibModule,
        AgmCoreModule.forRoot({
            apiKey: 'AIzaSyCHhkrGC1OG1djyg50LUZEr3mqXbwohpaM',
            libraries:['places']
        })
    ],
    providers: [
        ApiProvider,
        SettingProvider,
        HomeProvider,
        StudentProvider,
        TeacherProvider,
        GradStudentProvider,
        FileProvider,
        UserProvider,
        Guard,
        GuardAuth,
        Rsa,
        RequestProvider,
        ExcelProvider,
        CodeTypeProvider,
        CodeProvider
    ],
    bootstrap: [AppComponent]
})

export class AppModule { }
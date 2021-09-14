import { Component, ViewChild, OnInit, ElementRef } from '@angular/core';
import { ModalDirective } from 'ngx-bootstrap/modal';
import { Utils, Token } from '../../utilities';
import { TeacherProvider } from '../../providers';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { MapsAPILoader } from '@agm/core';
import { DeviceDetectorService } from 'ngx-device-detector';
import * as moment from 'moment';
declare let google: any;
@Component({
    selector: 'app-teacher-class-attendance',
    templateUrl: './teacher-class-attendance.component.html',
    styleUrls: ['./teacher-class-attendance.component.css']
})
export class TeacherClassAttendanceComponent implements OnInit {
    deviceStr:any='';
    lat = 43.879078;
    lng = -103.4615581;
    selectedMarker;
    address: string;
    //private geoCoder;
    @ViewChild('confirmModal', { static: true }) public confirmModal: ModalDirective;
    @ViewChild('infoModal', { static: true }) public infoModal: ModalDirective;
    @ViewChild('caModal', { static: true }) public caModal: ModalDirective;
    size: number = 5;
    selectStyleBtn: any = {};
    show: boolean = false;
    message: any = '';
    curClass: any = null;
    classes: any = [];
    curUser: any = {
        id: 0,
        userName: "admin",
        firstName: "Hao",
        lastName: "Lee",
        fullName: "Người dùng",
        language: "vi-vn",
        role: "",
        avatar: "assets/img/avatars/ava1.png"
    };
    // query
    query: any = {
        type: '',
        sessionId: '',
        classSession: null,
        showStudent: false,
        campusId: ''
    };
    campuses: any = [];
    sessions: any = [];
    students: any = {
        data: [],
        totalRecords: 0,
        page: 0,
        size: 5,
        totalPages: 0,
    };
    curStudent: any = null;
    attendanceInfo: any = [];
    curLocation: any = {
        lng: null,
        lat: null
    };
    deviceInfo = null;

    constructor(
        private router: Router,
        private proTeacher: TeacherProvider,
        private toastr: ToastrService,
        private mapsAPILoader: MapsAPILoader,
        private deviceService: DeviceDetectorService
        //private geoCoder: Geocoder,
    ) {
        if (navigator) {
            navigator.geolocation.getCurrentPosition(pos => {
                this.lng = +pos.coords.longitude;
                this.lat = +pos.coords.latitude;
                this.curLocation.lng = +pos.coords.longitude;
                this.curLocation.lat = +pos.coords.latitude;
            });
        }
        this.epicFunction();
    }

    ngOnInit(): void {
        this.getCurUser();
        // this.mapsAPILoader.load().then(() => {
        //     this.geoCoder = new google.maps.Geocoder;
        // });
    }

    epicFunction() {
        //console.log('hello `Home` component');
        this.deviceInfo = this.deviceService.getDeviceInfo();
        const isMobile = this.deviceService.isMobile();
        const isTablet = this.deviceService.isTablet();
        const isDesktopDevice = this.deviceService.isDesktop();
        //console.log(this.deviceInfo);
        //console.log(isMobile);  // returns if the device is a mobile device (android / iPhone / windows-phone etc)
        //console.log(isTablet);  // returns if the device us a tablet (iPad etc)
        //console.log(isDesktopDevice); // returns if the app is running on a Desktop browser.
        var str ='';
        if(isDesktopDevice)
        {
            str = str + '[Browser]' + this.deviceInfo.userAgent;
        }
        else if(isMobile || isTablet)
        {
            str = str + '[Mobile|Tablet]' + this.deviceInfo.userAgent;
            str = str + ' - [Device]' + this.deviceInfo.device;
        }
        this.deviceStr = str;
    }

    getCurUser() {
        let t = Token.getUser();
        if (t == null) {
            this.curUser = {
                id: 0,
                userName: "no-one",
                firstName: "Người",
                lastName: "dùng",
                fullName: "Người dùng",
                language: "vi-vn",
                role: "",
                avatar: "assets/img/avatars/ava1.png"
            }
        }
        else {
            this.curUser = t;
            this.getTeacherAllClass();
        }
    }

    getTeacherAllClass() {
        Utils.showSpinner(true);

        let x = {
            userId: this.curUser.id,
            status: 1
        };

        this.proTeacher.getTeacherAllClass(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.classes = rsp.data;
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToastError(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    changeClass(e) {
        if (e.target.value != "") {
            var index = parseInt(e.target.value) - 1;
            this.curClass = this.classes[index];
        }
        else {
            this.curClass = null;
        }
    }

    selectClass() {
        this.show = true;
        this.selectStyleBtn = { display: 'none' };
        this.getCampusOfSchool();
    }

    unSelectClass() {
        this.show = false;
        this.selectStyleBtn = {};
        this.curClass = null;
    }

    /// Start query Session
    getCampusOfSchool() {
        Utils.showSpinner(true);

        let x = {
            schoolId: this.curClass.schoolId
        };

        this.proTeacher.getCampusOfSchool(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.campuses = rsp.data;
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToastError(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    campusChange(e) {
        var camId = e.target.value;
        if (camId != "") {
            var id = parseInt(camId);
            var arr = this.campuses.filter(x => x.id == id);
            var item = arr[0];
            //console.log(item);
            this.lng = parseFloat(item.longtitude.trim());
            this.lat = parseFloat(item.latitude.trim());
        }
    }

    typeChange(e) {
        var type = e.target.value;
        this.query.classSession = null;
        if (type == "") {
            //this.showToastError("Vui lòng chọn ")

        }
        else {
            this.query.sessionId = '';
            this.getSessionForCheckAttendance();
        }
    }

    getSessionForCheckAttendance() {
        Utils.showSpinner(true);

        let x = {
            classId: this.curClass.classId,
            sessionType: this.query.type
        };

        this.proTeacher.getSessionForCheckAttendance(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.sessions = rsp.data;
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToastError(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    sessionChange(e) {
        var sesId = e.target.value;
        if (sesId != "") {
            var id = parseInt(sesId);
            var arr = this.sessions.filter(x => x.id == id);
            var item = arr[0];
            this.query.classSession = item;
            //console.log(item);
        }
        else {
            this.query.classSession = null;
        }
    }

    showStudent() {
        this.query.showStudent = true;
        this.getTeacherClassStudentAttendance(1);
    }

    unShowStudent() {
        this.query.showStudent = false;
        this.students = [];
    }

    getTeacherClassStudentAttendance(cPage) {
        Utils.showSpinner(true);

        var sid = parseInt(this.query.sessionId);
        let x = {
            classId: this.curClass.classId,
            classSessionId: sid,
            page: cPage,
            size: this.size
        };

        this.proTeacher.getTeacherClassStudentAttendance(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.students = rsp.data;
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToastError(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }
    getSTT(i) {
        var page = this.students.page;
        var stt = (page - 1) * this.size;
        stt = stt + i + 1;
        return stt;
    }

    pageChanged(event: any): void {
        //console.log('Page changed to: ' + event.page);
        //console.log('Number items per page: ' + event.itemsPerPage);
        this.getTeacherClassStudentAttendance(event.page);
    }

    completeSession() {
        //console.log(this.query.classSession);
        this.confirmModal.show();
    }

    completeSessionNext()
    {
        Utils.showSpinner(true);
        var sesId = parseInt(this.query.sessionId);
        let x = {
            classSessionId: sesId,
            modifiedBy: this.curUser.id
        };

        this.proTeacher.completeClassSession(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.query.classSession =null;
                this.query.sessionId ='';
                this.query.showStudent = false;
                //this.classes = rsp.data;
                var i =0;
                for(i=0; i<this.sessions.length; i++)
                {
                    if(this.sessions[i].id == sesId)
                        break;
                }
                this.sessions.splice(i, 1);
                this.showToastSuccess("Bạn đã hoàn tất buổi học !");
                this.confirmModal.hide();
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToastError(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    openInfoModal(i) {
        this.curStudent = this.students.data[i];
        this.loadDetailAttendanceOfStudent();

    }

    loadDetailAttendanceOfStudent() {
        Utils.showSpinner(true);

        var sid = parseInt(this.query.sessionId);
        let x = {
            classId: this.curClass.classId,
            classSessionId: sid,
            studentId: this.curStudent.studentId
        };

        this.proTeacher.loadDetailAttendanceOfStudent(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                this.attendanceInfo = rsp.data;
                //
                let config: any = {
                    backdrop: true,
                    ignoreBackdropClick: true
                };
                this.infoModal.config = config;
                this.infoModal.show();
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToastError(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    checkAttendanceStudent(i) {
        this.curStudent = this.students.data[i];

        let config: any = {
            backdrop: true,
            ignoreBackdropClick: true
        };
        this.caModal.config = config;
        this.caModal.show();
    }

    toBePresent() {
        //console.log(this.curStudent);
        //console.log(this.query.classSession);
        //console.log(this.query.campusId);
        var cId = parseInt(this.query.campusId);
        var arr = this.campuses.filter(x => x.id == cId);
        var cam = arr[0];

        let x = {
            classId: this.curClass.classId,
            studentId: this.curStudent.studentId,
            deviceId: this.deviceStr,
            latitude: this.lat.toString(),
            longtitude: this.lng.toString(),
            address: this.query.classSession.location + " | " + cam.address,
            note: 'Điểm danh ONLINE bởi GV thực hiện cho buổi [' + this.query.classSession.session + ']',
            refSessionId: this.query.classSession.id,
            createdBy: this.curUser.id,
            status: 1,
        };
        //console.log(x);
        Utils.showSpinner(true);

        this.proTeacher.checkAttendanceForStudent(x).subscribe((rsp: any) => {
            if (rsp.success) {
                //console.log(rsp.data);
                var stt = this.curStudent.attendanceStatus + 1;
                this.curStudent.attendanceStatus = stt;
                this.caModal.hide();
                this.showToastSuccess("Điểm danh thành công cho sinh viên [" + this.curStudent.fullname + "]");
            } else {
                this.message = rsp.message;
            }
            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showToastError(this.message);
            }
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }
    /////
    mapReady() {
        //this.geoCoder = new google.maps.Geocoder;
        //this.getAddress(this.lat, this.lng);
    }

    getAddress(lat: number, lng: number) {
        //console.log('Finding Address');
        if (navigator.geolocation) {
            let geocoder = new google.maps.Geocoder();
            let latlng = new google.maps.LatLng(lat, lng);
            let request = { latLng: latlng };
            geocoder.geocode(request, (results, status) => {
                if (status === google.maps.GeocoderStatus.OK) {
                    let result = results[0];
                    let rsltAdrComponent = result.address_components;
                    let resultLength = rsltAdrComponent.length;
                    if (result != null) {
                        this.address = rsltAdrComponent[resultLength - 8].short_name;
                    } else {
                        this.showToastError('No address available!');
                    }
                }
                else {
                    this.showToastError('status =' + status);
                    this.showToastError('results =' + results);
                }
            });
        }
        //console.log(this.address);
    }

    ////// GOOGLE MAP
    selectMarker(event) {
        this.selectedMarker = {
            lat: event.latitude,
            lng: event.longitude
        };
    }

    showToastSuccess(info) {
        this.toastr.success(info, 'Thông báo !', {
            timeOut: 4000,
            positionClass: 'toast-top-center',
            closeButton: true,
            progressBar: true,
            enableHtml: true
        });
    }

    showToastError(info) {
        this.toastr.warning(info, 'Thông báo !', {
            timeOut: 3000,
            positionClass: 'toast-top-center',
            closeButton: true,
            progressBar: true,
            enableHtml: true
        });
    }

    formatDate(str) {
        return moment(str).format('DD/MM/YYYY');
    }
    formatDate1(str) {
        return moment(str).format('DD/MM/YYYY HH:mm');
    }
}

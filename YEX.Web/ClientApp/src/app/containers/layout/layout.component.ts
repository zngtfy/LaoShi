import { Component, OnInit, ViewChild } from '@angular/core';
import { UserProvider, SettingProvider } from '../../providers';
import { Utils, Token } from '../../utilities';
import { ModalDirective } from 'ngx-bootstrap';
import * as $ from 'jquery';
import { ToastrService } from 'ngx-toastr';

@Component({
    selector: 'app-layout',
    templateUrl: './layout.component.html',
    styleUrls: ['./layout.component.css']
})
export class LayoutComponent implements OnInit {

    @ViewChild('editProfileModal', { static: false }) public editProfileModal: ModalDirective;
    @ViewChild('editPassModal', { static: false }) public editPassModal: ModalDirective;

    curUser: any = {
        id: 0,
        userName: "admin",
        firstName: "Hao",
        lastName: "Lee",
        fullName: "Người dùng",
        language: "vi-vn",
        role: "",
        avatar: "assets/img/avatars/ava1.png",
        base64Avatar: null,
        email: "",
        phone: "",
        address: "",
        oldPassword: null,
        newPassword: null,
        confirmPassword: null
    };
    avatarFile;

    constructor(
        private pro: UserProvider,
        private proSetting: SettingProvider,
        private toastr: ToastrService
    ) { }

    ngOnInit() {
        this.getCurUser();
    }

    uploadAvatar($event) {
        this.showAvatar($event.target);
    }

    showAvatar(inputValue: any): void {
        var file: File = inputValue.files[0];
        var myReader: FileReader = new FileReader();

        myReader.onloadend = (e) => {
            this.curUser.avatar = myReader.result;
            this.curUser.base64Avatar = myReader.result.toString().replace('data:image/jpeg;base64,', '');
        }
        myReader.readAsDataURL(file);
    }

    public showInformationModal(type: string, message: string = '') {
        if (type == 'error') {
            this.toastr.error('Lỗi xảy ra !', message, {
                timeOut: 3000,
                closeButton: true,
                progressBar: true,
                positionClass: 'toast-top-center'
            });
        }
        else if (type == 'success') {
            this.toastr.success('Thành công !', message, {
                timeOut: 3000,
                closeButton: true,
                progressBar: true,
                positionClass: 'toast-top-center'
            });
        }
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

            let x = {
                id: t.id,
            };

            this.pro.getInfo(x).subscribe((rsp: any) => {
                if (rsp.success) {
                    this.curUser.email = rsp.data.email;
                    this.curUser.phone = rsp.data.phone;
                    this.curUser.address = rsp.data.address;
                } else {
                    this.showInformationModal('error', rsp.message);
                }

                Utils.showSpinner(false);
            }, err => Utils.log(err));
        }
    }

    save(valid: boolean) {
        Utils.showSpinner(true);

        let x = {
            id: this.curUser.id,
            base64Avatar: this.curUser.base64Avatar,
            email: this.curUser.email,
            phone: this.curUser.phone,
            address: this.curUser.address
        };

        this.pro.uploadInfo(x).subscribe((rsp: any) => {
            if (rsp.success) {
                Token.setAvatar(this.curUser.avatar);
                this.showInformationModal('success', 'Cập nhật thông tin thành công.');
            } else {
                this.showInformationModal('error', rsp.message);
            }

            Utils.showSpinner(false);
        }, err => Utils.log(err));
    }

    openChangePassForm() {
        this.editPassModal.show();
        this.curUser.oldPassword = null;
        this.curUser.newPassword = null;
        this.curUser.confirmPassword = null;
    }

    changePass(valid: boolean) {
        Utils.showSpinner(true);

        if (this.curUser.oldPassword == null || this.curUser.oldPassword == '') {
            this.showInformationModal('error', 'Xin vui lòng nhập mật khẩu cũ');
        }
        if (this.curUser.newPassword == null || this.curUser.newPassword == '') {
            this.showInformationModal('error', 'Xin vui lòng nhập mật khẩu mới');
        }
        if (this.curUser.newPassword != this.curUser.confirmPassword) {
            this.showInformationModal('error', 'Mật khẩu xác nhận không đúng');
        }

        let x = {
            id: this.curUser.id,
            oldPassword: this.curUser.oldPassword,
            newPassword: this.curUser.newPassword,
        };

        this.pro.changePass(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.showInformationModal('success', 'Thay đổi mật khẩu thành công.');
                this.editPassModal.hide();
                this.signOut();
            } else {
                this.showInformationModal('error', rsp.message);
            }

            Utils.showSpinner(false);
        }, err => Utils.log(err));
    }

    signOut() {
        //console.log("out");
        this.pro.signOut();
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
}

import { Component, OnInit } from '@angular/core';
import { UserProvider } from 'src/app/providers';
import { ToastrService } from 'ngx-toastr';
import { Token, Utils } from 'src/app/utilities';

@Component({
    selector: 'app-user-change-pass',
    templateUrl: './user-change-pass.component.html',
    styleUrls: ['./user-change-pass.component.css']
})
export class UserChangePassComponent implements OnInit {

    curUser: any = {
        id: 0,
        oldPassword: null,
        newPassword: null,
        confirmPassword: null
    };

    constructor(
        private pro: UserProvider,
        private toastr: ToastrService) { }


    ngOnInit() {
        this.getCurUser();
    }

    getCurUser() {
        let t = Token.getUser();
        if (t == null) {
            this.curUser = {
                id: 0,
                oldPassword: null,
                newPassword: null,
                confirmPassword: null
            }
        }
        else {
            this.curUser = t;
        }
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
                this.signOut();
            } else {
                this.showInformationModal('error', rsp.message);
            }

            Utils.showSpinner(false);
        }, err => Utils.log(err));
    }

    signOut() {
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

import { Component, OnInit } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { Utils } from '../../utilities';
import { UserProvider, } from '../../providers';
import { ActivatedRoute, Params, Router } from '@angular/router';

@Component({
    selector: 'app-reset-password',
    templateUrl: './reset-password.component.html',
    styleUrls: ['./reset-password.component.css']
})

export class ResetPasswordComponent implements OnInit {
    public vm: any = { newPassword: '', confirmPassword: '' };
    public isValidToken: boolean;
    public reminderToken: string;
    public fullName: string;
    public userName: string;
    public reminderExpired: string;

    constructor(
        private pro: UserProvider,
        private toastr: ToastrService,
        private act: ActivatedRoute,
        private rou: Router
    ) { }

    ngOnInit() {
        Utils.showSpinner(true);

        this.act.params.subscribe((params: Params) => {
            this.reminderToken = params["reminderToken"];

            let x = {
                keyword: this.reminderToken,
            };

            this.pro.checkRequestResetPassword(x).subscribe((rsp: any) => {
                this.isValidToken = rsp.success;

                if (rsp.success) {
                    this.fullName = rsp.data.fullName;
                    this.userName = rsp.data.userName;
                    this.reminderExpired = rsp.data.reminderExpired;
                }

                Utils.showSpinner(false);
            }, err => Utils.log(err));
        });
    }

    public resetPassword() {
        if (this.vm.newPassword == null || this.vm.newPassword == '') {
            this.showInformationModal('error', 'Vui lòng nhập mật khẩu mới!');
            return;
        }
        if (this.vm.newPassword != null && this.vm.newPassword != this.vm.confirmPassword) {
            this.showInformationModal('error', 'Mật khẩu xác nhận không chính xác!');
            return;
        }

        Utils.showSpinner(true);

        let x = {
            reminderToken: this.reminderToken,
            newPassword: this.vm.newPassword,
        };

        this.pro.resetPassword(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.showInformationModal('success', 'Thiết lập lại mật khẩu mới thành công!');
                this.rou.navigate(['/sign-in']);
            } else {
                this.isValidToken = false;
            }

            Utils.showSpinner(false);
        }, err => Utils.log(err));
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
}
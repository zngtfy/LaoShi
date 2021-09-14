import { Component, OnInit, EventEmitter, Output, ChangeDetectorRef } from '@angular/core';
import { UserProvider } from 'src/app/providers';
import { ToastrService } from 'ngx-toastr';
import { Utils, Token } from 'src/app/utilities';
import { AdminLayoutComponent } from 'src/app/containers';

@Component({
    selector: 'app-user-profile',
    templateUrl: './user-profile.component.html',
    styleUrls: ['./user-profile.component.css']
})
export class UserProfileComponent implements OnInit {

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
        private header: AdminLayoutComponent,
        private pro: UserProvider,
        private toastr: ToastrService) { }


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
            this.toastr.error(message, 'Cập nhật thất bại!', {
                timeOut: 3000,
                closeButton: true,
                progressBar: true,
                positionClass: 'toast-top-center'
            });
        }
        else if (type == 'success') {
            this.toastr.success(message, 'Cập nhật thành công!', {
                timeOut: 3000,
                closeButton: true,
                progressBar: true,
                positionClass: 'toast-top-center'
            });
        }
    }

    getCurUser() {
        let t = Token.getUser();
        console.log(t);
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
        if(this.curUser.email == null || this.curUser.email == '') {
            this.showInformationModal('error', 'Vui lòng nhập email!');
            return;
        }

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
                this.header.refreshAvatar(this.curUser.avatar);
                Token.setAvatar(this.curUser.avatar);
                this.showInformationModal('success', null);
            } else {
                this.showInformationModal('error', rsp.message);
            }

            Utils.showSpinner(false);
        }, err => Utils.log(err));
    }
}

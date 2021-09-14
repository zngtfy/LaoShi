import { Component, OnInit, ElementRef, ViewChild } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { environment } from '../../../environments/environment';
import { Utils, Rsa } from '../../utilities';
import { UserProvider, SettingProvider } from '../../providers';
import * as $ from 'jquery';

@Component({
    selector: 'app-forget-password',
    templateUrl: './forget-password.component.html',
    styleUrls: ['./forget-password.component.css']
})

export class ForgetPasswordComponent implements OnInit {
    public vm: any = { email: '', captcha: null };
    public ioz: any = {};

    private SITE_ID = '6LeBrdYUAAAAACHtzoQWeTTLTkpQTFAeeTcvAwoe';
    private _reCaptchaId: number;

    @ViewChild('captchaRef2', { static: false }) captchaRef2: ElementRef;

    constructor(
        private pro: UserProvider,
        private proSetting: SettingProvider,
        private rsa: Rsa,
        private toastr: ToastrService
    ) { }

    ngOnInit() {
        if (!environment.production) {
            this.vm.userName = 'admin';
            this.vm.password = 'Qq12345!';
        }

        this.setLanguage('vi-vn');
    }

    ngAfterViewInit() {
        const grecaptcha = (window as any).grecaptcha;
        if (grecaptcha) {
            this._reCaptchaId = grecaptcha.render(this.captchaRef2.nativeElement, {
                'sitekey': this.SITE_ID,
                'callback': (resonse) => this.reCapchaSuccess(resonse),
                'expired-callback': () => this.reCapchaExpired()
            });
        }
    }

    reCapchaSuccess(data: any) {
        if (data) {
            this.vm.captcha = data;
        }
    }

    reCapchaExpired() {
        this.vm.captcha = null;
    }

    public isValid(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }

    public send() {
        if (this.vm.email == null || this.vm.email == '' || !this.isValid(this.vm.email)) {
            this.showInformationModal('error', 'Vui lòng nhập email!');
            return;
        }

        if (this.vm.captcha == null) {
            this.showInformationModal('error', 'Vui lòng kiểm tra RECAPTCHA của bạn để tiếp tục!');
            return;
        }

        Utils.showSpinner(true);

        let x = {
            keyword: this.vm.email,
        };

        this.pro.sendRequestResetPassword(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.vm = { email: '', captcha: null };

                const grecaptcha = (window as any).grecaptcha;
                grecaptcha.reset();

                this.showInformationModal('success', 'Yêu cầu thiết lập lại mật khẩu đã được gửi đến email: ' + x.keyword + '!');
            } else {
                this.showInformationModal('error', rsp.message);
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

    onLangChange(code: any) {
        console.log(code); //Here I want the changed value
        let file = code + '.json';

        this.proSetting.getLanguage(file).subscribe((rsp: any) => {
            this.ioz = rsp;
        }, err => Utils.log(err));
    }

    public setLanguage(code: string) {
        let file = code + '.json';

        this.proSetting.getLanguage(file).subscribe((rsp: any) => {
            this.ioz = rsp;
        }, err => Utils.log(err));
    }
}
import { Component, OnInit, ElementRef, ViewChild } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { environment } from '../../../environments/environment';
import { Utils, Rsa } from '../../utilities';
import { UserProvider, SettingProvider } from '../../providers';
import * as $ from 'jquery';

@Component({
    selector: 'app-sign-in',
    templateUrl: './sign-in.component.html',
    styleUrls: ['./sign-in.component.css']
})

export class SignInComponent implements OnInit {
    public vm: any = { userName: '', password: '', email: '', captcha: null };
    public ioz: any = {};
    public message = '';

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
        this.getConfig();
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

    public signIn() {
        Utils.showSpinner(true);

        if (this.vm.captcha == null) {
            this.message = 'Vui lòng kiểm tra recaptcha';
            this.showInformationModal(true);
            Utils.showSpinner(false);
            return;
        }

        let x = {
            userName: this.vm.userName,
            password: this.rsa.encrypt(this.vm.password)
        };

        this.pro.signIn(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.message = '';
                this.pro.saveAuth(rsp.data);
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showInformationModal(true);
            }
        }, err => Utils.log(err));
    }

    public showInformationModal(display: boolean) {
        if (display) {
            //this.informationModal.show();
            this.toastr.error('Lỗi xảy ra !', this.message, {
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

    private getConfig() {
        this.pro.getConfig().subscribe((rsp: any) => {
            if (rsp.success) {
                this.rsa.enabled = rsp.data.rsaMode;
                this.rsa.publicKey = rsp.data.rsaPublicKey;
            } else {
                this.message = rsp.message;
            }

            Utils.showSpinner(false);

            if (this.message !== '') {
                this.showInformationModal(true);
            }
        }, err => Utils.log(err));
    }
}
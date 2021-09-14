import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { HomeProvider } from 'src/app/providers';
import { Utils } from 'src/app/utilities';
import { ToastrService } from 'ngx-toastr';
import { RequestProvider } from 'src/app/providers/request';
import { Router } from '@angular/router';

@Component({
    selector: 'app-contact',
    templateUrl: './contact.component.html',
    styleUrls: ['./contact.component.css']
})
export class ContactComponent implements OnInit {
    public vm: any = { requestBy: '', requestType: '', requestName: '', content: '', captcha: null };
    public requestTypes = [];

    private SITE_ID = '6LeBrdYUAAAAACHtzoQWeTTLTkpQTFAeeTcvAwoe';
    private COOKIE_CONSENT = 'contact';
    private COOKIE_CONSENT_EXPIRE_DAYS = 1;
    private _reCaptchaId: number;
    private _isConsented: boolean = false;

    @ViewChild('captchaRef2', { static: false }) captchaRef2: ElementRef;

    constructor(
        private pro: HomeProvider,
        private proReq: RequestProvider,
        private toastr: ToastrService
    ) { }

    ngOnInit() {
        this.loadRequestType();
    }

    loadRequestType() {
        Utils.showSpinner(true);

        let x = {
            page: 1,
            size: 10
        };
        this.pro.loadRequestType(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.requestTypes = rsp.data;
                Utils.showSpinner(false);
            } else {
                this.showInformationModal('error', rsp.message);
            }
            Utils.showSpinner(false);
        }, err => {
            Utils.log(err);
            Utils.showSpinner(false);
        });
    }

    ngAfterViewInit() {
        const grecaptcha = (window as any).grecaptcha;
        if (grecaptcha && this.getCookie('contact') == '') {
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

    send(valid: boolean) {
        Utils.showSpinner(true);

        if(this.getCookie('contact') != '') {
            this.showInformationModal('error', 'Vui lòng nhập đầy đủ');
            Utils.showSpinner(false);
            return;
        }

        if (!valid) {
            this.showInformationModal('error', 'Vui lòng nhập đầy đủ');
            Utils.showSpinner(false);
            return;
        }

        if (this.vm.captcha == null) {
            this.showInformationModal('error', 'Vui lòng kiểm tra recaptcha');
            Utils.showSpinner(false);
            return;
        }

        let x = {
            requestType: this.vm.requestType,
            requestName: this.vm.requestName,
            content: '<h3>' + this.vm.requestBy + '</h3>' + this.vm.content
        };

        this.proReq.addRequest(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.setCookie('contact', this.vm.captcha, 1);
                this.vm = { requestType: '', requestName: '', content: '', captcha: null };

                const grecaptcha = (window as any).grecaptcha;
                grecaptcha.reset();

                this.showInformationModal('success', 'Nội dung đã được gửi đi.');
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

    public getCookie(name: string) {
        let ca: Array<string> = document.cookie.split(';');
        let caLen: number = ca.length;
        let cookieName = `${name}=`;
        let c: string;

        for (let i: number = 0; i < caLen; i += 1) {
            c = ca[i].replace(/^\s+/g, '');
            if (c.indexOf(cookieName) == 0) {
                return c.substring(cookieName.length, c.length);
            }
        }
        return '';
    }

    private deleteCookie(name) {
        this.setCookie(name, '', -1);
    }

    private setCookie(name: string, value: string, expireMinutes: number, path: string = '') {
        let d: Date = new Date();
        d.setTime(d.getTime() + expireMinutes * (60 * 1000));
        let expires: string = `expires=${d.toUTCString()}`;
        let cpath: string = path ? `; path=${path}` : '';
        document.cookie = `${name}=${value}; ${expires}${cpath}`;
    }

    private consent(isConsent: boolean, e: any) {
        if (!isConsent) {
            return this._isConsented;
        } else if (isConsent) {
            this.setCookie(this.COOKIE_CONSENT, '1', this.COOKIE_CONSENT_EXPIRE_DAYS);
            this._isConsented = true;
            e.preventDefault();
        }
    }
}

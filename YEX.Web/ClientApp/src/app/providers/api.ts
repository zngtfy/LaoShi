import { environment } from '../../environments/environment';
import { Injectable } from '@angular/core';
import { Utils, Token } from '../utilities';
import { HttpClient, HttpParams, HttpHeaders, HttpRequest, HttpEvent } from '@angular/common/http';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';

/**
 * @author ToanNguyen 2019-Oct-23 12:43
 */
@Injectable()
export class ApiProvider {
    public apiUrl = '';
    public assetUrl = '';
    public imgUrl = '';

    constructor(
        private http: HttpClient,
        private rou: Router
    ) {
        if (environment.production) {
            let t = !environment.apiUrl.startsWith(location.origin) ? location.origin : '';
            this.apiUrl = t + environment.apiUrl;

            t = !environment.imgUrl.startsWith(location.origin) ? location.origin : '';
            this.imgUrl = t + environment.imgUrl;
        }
        else {
            this.apiUrl = environment.apiUrl;
            this.imgUrl = environment.imgUrl;
        }

        Token.updateInfo();
    }

    /**
     * Support GET method
     * @param endpoint
     * @param isAuth
     * @param params
     * @param reqOpts
     */
    public get(endpoint: string, isAuth: boolean = true, params?: any, reqOpts?: any) {
        let token = '';

        if (isAuth) {
            token = this.getToken();
            if (token === '') {
                this.rou.navigate(['/']);
                return new Observable<ArrayBuffer>();
            }
        }

        if (!reqOpts) {
            reqOpts = {
                headers: new HttpHeaders().set('Authorization', token),
                params: new HttpParams()
            };
        }

        // Support easy query params for GET requests
        if (params) {
            reqOpts.params = new HttpParams();
            for (let i in params) {
                reqOpts.params.set(i, params[i]);
            }
        }

        return this.http.get(this.apiUrl + endpoint, reqOpts);
    }

    public getAsset(endpoint: string, params?: any, reqOpts?: any)
    {
        // Support easy query params for GET requests
        if (params) {
            reqOpts.params = new HttpParams();
            for (let i in params) {
                reqOpts.params.set(i, params[i]);
            }
        }

        return this.http.get(this.assetUrl + endpoint, reqOpts);
    }

    /**
     * Support POST method
     * @param endpoint
     * @param body
     * @param isAuth
     * @param reqOpts
     */
    public post(endpoint: string, body: any, isAuth: boolean = true, reqOpts?: any) {
        let token = '';

        if (isAuth) {
            token = this.getToken();
            if (token === '') {
                this.rou.navigate(['/']);
                return new Observable<ArrayBuffer>();
            }
        }

        if (!reqOpts) {
            let t = new HttpHeaders().set('Authorization', token);
            t = t.append('Content-Type', 'application/json');
            reqOpts = { headers: t };
        }

        return this.http.post(this.apiUrl + endpoint, body, reqOpts);
    }

    public upload(endpoint: string, formData: FormData) {
        let token = '';
        token = this.getToken();
        if (token === '') {
            this.rou.navigate(['/']);
            return new Observable<ArrayBuffer>();
        }
        let t = new HttpHeaders().set('Authorization', token);
        //t = t.append('Content-Type', 'application/json');
        return this.http.post(this.apiUrl + endpoint, formData, { headers: t });
    }

    public download(endpoint: string, body: any) {
        return this.http.post(this.apiUrl + endpoint, body, { responseType: 'blob'});
    }

    

    /**
     * Get token
     */
    private getToken(): string {
        let res = '';

        Utils.log('***********getToken()***********');

        let t = Token.getToken();
        let ok = Token.isExpired(t);
        if (!ok) {
            res = 'Bearer ' + t;
            Token.lastAccess = Utils.now();
            Utils.logDate('Las', Token.lastAccess);
        }

        Utils.log('********************************');

        return res;
    }
}
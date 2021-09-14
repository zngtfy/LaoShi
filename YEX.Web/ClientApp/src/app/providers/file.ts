import { environment } from '../../environments/environment';
import { Injectable } from '@angular/core';
import { Utils, Token } from '../utilities';
import { HttpClient, HttpParams, HttpHeaders, HttpRequest, HttpEvent } from '@angular/common/http';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';

@Injectable()
export class FileProvider {
    public apiUrl = '';
    public assetUrl = '';
    public imgUrl = '';

    constructor(private http: HttpClient) {
        // nothing to do
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
    }

    download(endpoint: string) {
        return this.http.get(this.assetUrl+endpoint, 
            {responseType: 'blob'});
    }
}
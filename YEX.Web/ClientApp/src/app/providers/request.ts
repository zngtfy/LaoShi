import { Injectable } from '@angular/core';
import { ApiProvider } from './api';
import { Router } from '@angular/router';

/**
 * @author AnNguyen 2020-Feb-08 07:44
 */
@Injectable()
export class RequestProvider {
    private prefix = 'api/Request/';

    constructor(
        private api: ApiProvider,
        private rou: Router
    ) { }

    public addRequest(info: any) {
        return this.api.post(this.prefix + 'add-request', info, false, false);
    }

    public loadRequest(info: any) {
        return this.api.post(this.prefix + 'load-request', info, false, false);
    }

    public resultRequest(info: any) {
        return this.api.post(this.prefix + 'result-request', info, false, false);
    }
}
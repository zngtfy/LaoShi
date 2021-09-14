import { Injectable } from '@angular/core';
import { ApiProvider } from './api';
import { Observable } from 'rxjs';

/**
 * @author ToanNguyen 2019-Oct-23 12:43
 */
@Injectable()
export class SetupProvider {
    private prefix = 'api/Setup/';

    constructor(private api: ApiProvider) { }

    /**
     * Translate to ZnG language
     * @param info
     */
    public toZng(info: any): Observable<any> {
        return this.api.post(this.prefix + 'zng', info, false);
    }
}
import { Injectable } from '@angular/core';
import { ApiProvider } from '../providers/api';
import { Observable } from 'rxjs';

/**
 * @author ToanNguyen 2019-Aug-19 11:39 (verified)
 */
@Injectable()
export class SettingProvider {
    private prefix = 'api/Setting/';

    constructor(private api: ApiProvider) { }

    /**
     * Language
     * @param file
     */
    public getLanguage(file: string): Observable<any> {
        return this.api.getAsset('assets/language/' + file, false, false);
    }
}
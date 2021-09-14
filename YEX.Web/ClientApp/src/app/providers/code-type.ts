import { Injectable } from '@angular/core';
import { ApiProvider } from '../providers/api';
import { Router } from '@angular/router';

/**
 * @author 
 */
@Injectable()
export class CodeTypeProvider {
    private prefix = 'api/CodeType/';

    constructor(
        private api: ApiProvider,
        private rou: Router
    ) { }
    
    /**
     * Search
     * @param info
     */
    public search(info: any) {
        return this.api.post(this.prefix + 'search', info, true, false);
    }
    
    /**
     * Add new
     * @param info
     */
    public add(info: any) {
        return this.api.post(this.prefix + 'create', info, true, false);
    }
    
    /**
     * Update
     * @param info
     */
    public update(info: any) {
        return this.api.post(this.prefix + 'update', info, true, false);
    }
}
import { Injectable } from '@angular/core';
import { ApiProvider } from '../providers/api';
import { Router } from '@angular/router';

/**
 * @author 
 */
@Injectable()
export class CodeProvider {
    private prefix = 'api/Code/';

    constructor(
        private api: ApiProvider,
        private rou: Router
    ) { }
    
    /**
     * Search by types
     * @param info
     */
    public searchByTypes(info: any) {
        return this.api.post(this.prefix + 'search-by-types', info, true, false);
    }
    
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
        return this.api.post(this.prefix + 'create', info, false, false);
    }
    
    /**
     * Update
     * @param info
     */
    public update(info: any) {
        return this.api.post(this.prefix + 'update', info, false, false);
    }
}
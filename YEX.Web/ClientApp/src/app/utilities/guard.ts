import { Injectable } from '@angular/core';
import { Token } from './token';

import {
    Router,
    CanActivate,
    CanActivateChild,
    ActivatedRouteSnapshot,
    RouterStateSnapshot
} from '@angular/router';

/**
 * @author ToanNguyen 2019-Aug-19 11:39 (verified)
 */
@Injectable()
export class Guard implements CanActivate, CanActivateChild {
    constructor(private rou: Router) { }

    /**
     * Can activate
     * @param route
     * @param state
     */
    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
        let url = route.url[0].path;
        //console.log(url);
        let t = Token.hasAccessUrl(url);
        if (t === false) {
            this.rou.navigate(['/page-not-found']);
            return false;
        }
        return true;
    }

    /**
     * Can activate child
     * @param route
     * @param state
     */
    canActivateChild(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
        return this.canActivate(route, state);
    }

}
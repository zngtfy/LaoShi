import { Injectable } from '@angular/core';
import { Token } from './token';
import { Router, CanActivate } from '@angular/router';

/**
 * @author AnNguyen 2020-Feb-06 02:14
 */
@Injectable()
export class GuardAuth implements CanActivate {
    constructor(private rou: Router) { }

    canActivate(): boolean {
        let t = Token.getUser();
        if (t != null) {
            this.rou.navigate(['/home']);
            return false;
        }
        return true;
    }
}
import { Injectable } from '@angular/core';
import { Utils } from './utils';
import { JwtHelperService } from '@auth0/angular-jwt';

/**
 * @author ToanNguyen 2019-Dec-10 11:11 (verified)
 */
@Injectable()
export class Token {
    public static tokenInfo: any;
    public static runSignOut: Date;
    public static runRefresh: Date;
    public static lastAccess: Date;
    public static intSignOut = 0;
    public static intRefresh = 0;
    public static signOut = true;

    private static storageId = 'Z-JWT';
    private static storageClassId = 'HL-Class';
    private static storageThesisId = 'HL-Thesis';
    private static avatarId = 'A-AVATAR';

    /**
     * Can refresh
     */
    public static canRefresh(): boolean {
        Utils.log('**********canRefresh()**********');

        let t1 = this.runRefresh <= this.lastAccess;
        let t2 = this.lastAccess <= this.runSignOut;
        let res = t1 && t2;

        Utils.logDate('Ref', this.runRefresh);
        Utils.logDate('Las', this.lastAccess);
        Utils.logDate('Out', this.runSignOut);
        Utils.log('Ref ' + this.runRefresh.getTime());
        Utils.log('Las ' + this.lastAccess.getTime());
        Utils.log('Out ' + this.runSignOut.getTime());
        Utils.log('Res ' + res);

        Utils.log('********************************');

        return res;
    }

    /**
     * Update information
     */
    public static updateInfo(): void {
        let t = this.getInfo();
        if (t === null) { return; }

        Utils.log('*******Token.updateInfo()*******');
        this.tokenInfo = t;

        /* Timeline
        -Not before---lastAccess-----runRefresh-----runSignOut------Expiration-->
            |            |<-intRefresh->|<---refresh--->|<---signOut--->|
            |            |<---------intSignOut--------->|               |
            |                           |<-----------buffer------------>|
        */

        // Time before Expiration to call sign out (second)
        let signOut = 15; // [10-30]
        if (signOut < 10) {
            signOut = 10;
            Utils.log('Time before to call sign out min = 10 seconds');
        }
        if (signOut > 30) {
            signOut = 30;
            Utils.log('Time before to call sign out max = 30 seconds');
        }
        Utils.log(signOut + ' time before to call sign out (second)');
        //-------------------------------------------------------------

        // Time before _runSignOut to call refresh (second)
        let refresh = 15;[10 - 30];
        if (refresh < 10) {
            refresh = 10;
            Utils.log('Time before to call refresh min = 10 seconds');
        }
        if (refresh > 30) {
            refresh = 30;
            Utils.log('Time before to call refresh max = 30 seconds');
        }
        Utils.log(refresh + ' time before to call refresh (second)');
        //-------------------------------------------------------------

        // Buffer (second)
        let buffer = signOut + refresh; // [20-60]
        Utils.log(buffer + ' buffer (second)');
        //-------------------------------------------------------------

        // Token time (second)
        let sec = t.exp - t.nbf;
        if (sec < 30) {
            sec = 30;
            Utils.log('Token time min = 30 seconds');
        }
        Utils.log(sec + ' token time (second) | ' + sec / 60 + ' (minute)');
        //-------------------------------------------------------------

        // Not before
        let nbf = new Date(t.nbf * 1000);
        Utils.logDate('Nbf', nbf);
        //-------------------------------------------------------------

        // Last access
        this.lastAccess = Utils.now();
        Utils.logDate('Las', this.lastAccess);
        //-------------------------------------------------------------

        // Run refresh
        let x = t.exp - buffer;
        this.runRefresh = new Date(x * 1000);
        Utils.logDate('Ref', this.runRefresh);
        //-------------------------------------------------------------

        // Run sign out
        x = t.exp - signOut;
        this.runSignOut = new Date(x * 1000);
        Utils.logDate('Out', this.runSignOut);
        //-------------------------------------------------------------

        // Expiration
        let exp = new Date(t.exp * 1000);
        Utils.logDate('Exp', exp);
        //-------------------------------------------------------------

        // Interval refresh
        x = this.runRefresh.getTime() - this.lastAccess.getTime();
        if (x <= 0) {
            x = signOut * 1000; // convert to millisecond
        }
        this.intRefresh = x;
        x = x / 1000; // convert to second
        Utils.log(x + ' interval refresh (second) | ' + x / 60 + ' (minute)');
        //-------------------------------------------------------------

        // Interval sign out
        x = this.runSignOut.getTime() - this.lastAccess.getTime();
        if (x <= 0) {
            x = buffer * 1000; // convert to millisecond
        }
        this.intSignOut = x
        x = x / 1000; // convert to second
        Utils.log(x + ' interval sign out (second) | ' + x / 60 + ' (minute)');
        //-------------------------------------------------------------

        // Valid interval refresh
        if (this.intRefresh === this.intSignOut) {
            x = refresh * 1000;// convert to millisecond
            if (this.intRefresh <= x) {
                this.intRefresh = this.intSignOut - x / 2;
                x = this.intRefresh / 1000; // convert to second
                Utils.log(x + ' update interval refresh (second) | ' + x / 60 + ' (minute)');
            }
        }
        //-------------------------------------------------------------

        Utils.log('********************************');
    }

    /**
     * Get token in local storage
     */
    public static getToken(): string {
        let res = localStorage.getItem(this.storageId);
        return res;
    }


    /**
     * Set token to local storage
     * @param token
     */
    public static setToken(token: string): void {
        let t = this.isExpired(token);
        if (t) {
            return;
        }

        this.removeToken();
        localStorage.setItem(this.storageId, token);
        this.updateInfo();

        // Avatar
        let a = this.decodeToken(token);
        if (a) {
            this.setAvatar(a.payload.avatar);
        }
    }

    public static setCurClass(curCls: string): void {
        let t = this.isExpired(curCls);
        if (t) {
            return;
        }

        this.removeCurCls();
        localStorage.setItem(this.storageClassId, curCls);
    }

    public static setCurThesis(curThesis: string): void {
        let t = this.isExpired(curThesis);
        if (t) {
            return;
        }

        this.removeCurThesis();
        localStorage.setItem(this.storageThesisId, curThesis);
    }

    public static removeCurCls(): void {
        localStorage.removeItem(this.storageClassId);
    }

    public static removeCurThesis(): void {
        localStorage.removeItem(this.storageThesisId);
    }

    public static getCurCls(): any {
        let loc = localStorage.getItem(this.storageClassId);
        let t = this.decodeToken(loc);
        if (t == null) {
            return null;
        }

        let res = t.payload;
        return res;
    }

    public static getCurThesis(): any {
        let loc = localStorage.getItem(this.storageThesisId);
        let t = this.decodeToken(loc);
        if (t == null) {
            return null;
        }

        let res = t.payload;
        return res;
    }

    /**
     * Remove token in local storage
     */
    public static removeToken(): void {
        localStorage.removeItem(this.storageId);
    }

    /**
     * Decode token
     * @param token
     */
    public static decodeToken(token: string): any {
        let res: any = {};

        try {
            let t = new JwtHelperService();
            res = t.decodeToken(token);
        }
        catch (ex) {
            Utils.log(ex.message);
        }

        return res;
    }

    /**
     * Check token is expired
     * @param token
     */
    public static isExpired(token: string): boolean {
        let res = true;

        try {
            let t = new JwtHelperService();
            res = t.isTokenExpired(token);
        }
        catch (ex) {
            Utils.log(ex.message);
        }

        return res;
    }

    /**
     * Get user information
     */
    public static getUser(): any {
        let t = this.getInfo();
        if (t == null) {
            return null;
        }

        let res = t.payload;

        // Avatar
        res.avatar = this.getAvatar();

        return res;
    }

    public static getUserRole(): any {
        let t = this.getInfo();
        if (t == null) {
            return null;
        }

        let res = t.payload.role;
        return res;
    }

    /**
     * Check permission to have access
     * @param ar Access right
     */
    public static hasAccess(ar: string) {
        let res = false;

        try {
            let t = this.getUser().accessRights;
            res = t.indexOf(ar) >= 0;
        }
        catch (ex) {
            Utils.log(ex.message);
        }

        return res;
    }

    public static hasAccessUrl(ar: string) {
        let res = false;
        try {
            let t = this.getUser().urls;
            res = t.indexOf(ar) >= 0;
        }
        catch (ex) {
            Utils.log(ex.message);
        }
        return res;
    }

    /**
     * Remove avatar in local storage
     */
    public static removeAvatar(): void {
        localStorage.removeItem(this.avatarId);
    }

    /**
     * Set avatar to local storage
     */
    public static setAvatar(base64Avatar: string): void {
        localStorage.setItem(this.avatarId, base64Avatar);
    }

    /**
     * Get avatar from local storage
     */
    public static getAvatar(): string {
        let res = localStorage.getItem(this.avatarId);
        return res;
    }

    /**
     * Get token information
     */
    private static getInfo(): any {
        let t = this.getToken();
        let res = this.decodeToken(t);
        return res;
    }
}
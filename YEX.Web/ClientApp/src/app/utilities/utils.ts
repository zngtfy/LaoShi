import { Injectable } from '@angular/core';
import { environment } from '../../environments/environment';
import { DatePipe } from '@angular/common';

/**
 * @author ToanNguyen 2019-Aug-19 11:39 (verified)
 */
@Injectable()
export class Utils {
    /**
     * Write log
     * @param o Date
     */
    public static log(o: any): void {
        if (environment.showLog) {
            let t = this.format(this.now(), 'dd-MMM-yyy HH:mm:ss');
            console.log(t + ' | ' + o);
        }
    }

    /**
     * Write log
     * @param s Name
     * @param d Value
     */
    public static logDate(s: string, d: Date): void {
        if (this.isDate(d)) {
            let t = this.format(d, 'dd-MMM-yyy HH:mm:ss')
            this.log(s + ' ' + t);
        }
        else {
            this.log(s + ' ' + d);
        }
    }

    /**
     * Now
     */
    public static now(): Date {
        let t = new Date();
        let x = t.setMilliseconds(0);
        let res = new Date(x);
        return res;
    }

    /**
     * Is date
     * @param d
     */
    public static isDate(d: Date): boolean {
        let res = true;

        if (Object.prototype.toString.call(d) === "[object Date]") {
            if (isNaN(d.getTime())) {
                res = false;
            }
        }
        else {
            res = false;
        }

        return res;
    }

    /**
     * Convert to string
     * @param d Date and time
     * @param f String format
     */
    public static format(d: Date, f: string): string {
        let res = '';

        if (d != null) {
            let t = new DatePipe('en-us');
            res = t.transform(d, f);
        }

        return res;
    }

    /**
     * Clone data
     * @param data
     */
    public static clone(data: any): any {
        if (data != null) {
            return JSON.parse(JSON.stringify(data));
        }
        else {
            return null;
        }
    }

    /**
     * Show spinner
     * @param display
     */
    public static showSpinner(display: boolean) {
        document.getElementById('zLoader').style.display = display ? 'block' : 'none';
    }
}
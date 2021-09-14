// This file can be replaced during build by using the `fileReplacements` array.
// `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const environment = {
    production: false,
    showLog: true,
    //apiUrl: '/',
    //imgUrl: '/assets/img/',
    apiUrl: 'https://localhost:44307/',
    imgUrl: 'https://localhost:44307/assets/img/',
    //apiUrl: 'http://localhost:5000/',
    //imgUrl: 'http://localhost:5000/assets/img/',
    //apiUrl: 'http://appointvn.com:5050/',
    //imgUrl: 'http://appointvn.com:5050/assets/img/'
};

/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.
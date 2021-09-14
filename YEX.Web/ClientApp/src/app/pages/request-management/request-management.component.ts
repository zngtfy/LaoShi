import { Component, OnInit, ViewChild } from '@angular/core';
import { RequestProvider } from 'src/app/providers';
import { ModalDirective } from 'ngx-bootstrap';
import { Token } from 'src/app/utilities';

@Component({
    selector: 'app-request-management',
    templateUrl: './request-management.component.html',
    styleUrls: ['./request-management.component.css']
})
export class RequestManagementComponent implements OnInit {

    @ViewChild('resultModal', { static: false }) public resultModal: ModalDirective;

    requests = [];
    resultRequest: String;
    requestId: String;

    constructor(
        private proReq: RequestProvider
    ) { }

    ngOnInit() {
        let x = {
            page: 1,
            size: 10
        };

        this.proReq.loadRequest(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.requests = rsp.data.data;
            }
        });
    }

    result(requestId) {
        this.resultModal.show();
        this.requestId = requestId;
    }

    save() {
        let t = Token.getUser();

        let x = {
            id: this.requestId,
            resultBy: t.id,
            result: this.resultRequest
        };

        this.proReq.resultRequest(x).subscribe((rsp: any) => {
            if (rsp.success) {
                this.resultModal.hide();
            }
        });
    }
}

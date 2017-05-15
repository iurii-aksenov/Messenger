import { Component, OnInit } from '@angular/core';
import { MiddleService } from "./../../shared/middle.service";



@Component({
    moduleId: module.id,
    selector: 'middle',
    templateUrl: 'middle.component.html',
    styleUrls: ['middle.component.css']
})
export class MiddleComponent implements OnInit {

    account: any = null;

    constructor(private middleService: MiddleService) { }

    ngOnInit() {
        this.logIn(1);
    }

    logIn(id: number) {
        this.middleService.getAccount(1)
            .subscribe((account) => {
                    this.account = account;  
            }   
            )
    }

}
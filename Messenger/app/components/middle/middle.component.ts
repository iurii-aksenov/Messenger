import { Component, OnInit } from '@angular/core';
import { MiddleService } from "./../../shared/middle.service";
import { Account } from "./../../shared/account.model";



@Component({
    moduleId: module.id,
    selector: 'middle',
    templateUrl: 'middle.component.html',
    styleUrls: ['middle.component.css']
})
export class MiddleComponent implements OnInit {

    account: Account;

    constructor(private middleService: MiddleService) { 
        this.account = null;
    }

    ngOnInit() {
      
    }

    logIn(id: number) {
        this.middleService.getAccount(1)
            .subscribe((account) => {
                    this.account =  new Account(
                                    account.id,
                                    account.password,
                                    account.firstName,
                                    account.lastName,
                                    account.birthdate,
                                    account.sex,
                                    account.phone,
                                    account.email,
                                    );
            }   
            )
    }

}
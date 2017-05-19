import { Component, OnInit } from '@angular/core';
import { MiddleService } from "./../../shared/services/middle.service";
import { Account } from "./../../shared/models/account.model";
import { Observable } from 'rxjs/Observable';
import { Subscription }   from 'rxjs/Subscription';




@Component({
    moduleId: module.id,
    selector: 'middle',
    templateUrl: 'middle.component.html',
    styleUrls: ['middle.component.css']
})
export class MiddleComponent implements OnInit {

    middleScreen: number = MiddleScreen.Greeting;
    middleScreenSubscription: Subscription;

    
    account: Account;

   

    constructor(private middleService: MiddleService) { 
        this.middleScreenSubscription = middleService.
        this.account = null;
    }

    ngOnInit() {
      
    }

    logIn(id: number) {
        this.middleService.getAccount(1)
            .subscribe((account) => {
                    this.account =  new Account(
                                    account.accountId,
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

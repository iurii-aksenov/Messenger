import { Component, OnInit, OnDestroy } from '@angular/core';
import { MiddleService } from "./../../shared/services/middle.service";
import { Account } from "./../../shared/models/account.model";
import { Observable } from 'rxjs/Observable';
import { Subscription } from 'rxjs/Subscription';


import { MiddleScreen } from "../../shared/models/middle-screen.enum";



@Component({
    moduleId: module.id,
    selector: 'middle',
    templateUrl: 'middle.component.html',
    styleUrls: ['middle.component.css']
})
export class MiddleComponent implements OnInit, OnDestroy {

    middleScreen: MiddleScreen  = MiddleScreen.Creating;
    middleScreenSubscription: Subscription;


    account: Account;



    constructor(private middleService: MiddleService) {
        this.middleScreenSubscription = middleService.middleScreen$.subscribe(middleScreeState => {
            this.middleScreen = middleScreeState == null ? MiddleScreen.Greeting : middleScreeState;
            console.log(middleScreeState);
        });


        this.account = null;
    }

    ngOnInit() {

    }

    logIn(id: number) {
        this.middleService.getAccount(1)
            .subscribe((account) => {
                this.account = new Account(
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

    ngOnDestroy() {
        this.middleScreenSubscription.unsubscribe();
    }


}

import { Component, OnInit, OnDestroy } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import { Subscription } from 'rxjs/Subscription';


import { MiddleScreenState } from "../../shared/models/middle-screen.enum";
import { IContact } from "./../../shared/models/contact.model";
import { Account } from "./../../shared/models/account.model";
import { MiddleService } from "./../../shared/services/middle.service";


@Component({
    moduleId: module.id,
    selector: 'middle',
    templateUrl: 'middle.component.html',
    styleUrls: ['middle.component.css']
})
export class MiddleComponent implements OnInit, OnDestroy {

    middleScreenState: MiddleScreenState  = MiddleScreenState.Creating;
    middleScreenStateSubscription: Subscription;


    account: Account;



    constructor(private middleService: MiddleService) {
        this.middleScreenStateSubscription = middleService.middleScreenState$.subscribe(middleScreenState => {
            this.middleScreenState = middleScreenState == null ? MiddleScreenState.Greeting : middleScreenState;
        });
        this.account = null;
    }

    addContact(contact: IContact){
        this.middleService.addContact(contact);

    }

    closeAddingContact(close: boolean = false){
        close ? this.middleService.closeAddingContact() : null;
    }

    ngOnInit() {

    }

    logIn(id: number) {
        // this.middleService.getAccount(1)
        //     .subscribe((account) => {
        //         this.account = new Account(
        //             account.password,
        //             account.firstName,
        //             account.lastName,
        //             account.birthdate,
        //             account.sex,
        //             account.phone,
        //             account.email,
        //         );
        //     }
        //     )
    }

    ngOnDestroy() {
        this.middleScreenStateSubscription.unsubscribe();
    }


}

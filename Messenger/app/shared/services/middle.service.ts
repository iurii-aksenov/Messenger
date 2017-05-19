import { Injectable, OnDestroy } from '@angular/core';

import { AppService } from "./app.service";
import { Observable } from 'rxjs/Observable';
import { Subscription }   from 'rxjs/Subscription';
import { Subject }   from 'rxjs/Subject';
//import 'rxjs/add/operator/fromPromise';
// import 'rxjs/add/operator/catch';
// import 'rxjs/add/observable/throw';
import 'rxjs/Rx';

import { MiddleScreen } from "../models/middle-screen.enum";

import { IContact } from "./../models/contact.model";
import { IAccount } from "./../models/account.model";

@Injectable()
export class MiddleService{

    private middleScreen = new Subject<MiddleScreen>()
    middleScreen$ = this.middleScreen.asObservable();

    constructor(private appService: AppService) {
        appService.middleScreen$.subscribe(middleScreenState =>
        {
            this.middleScreen.next(middleScreenState);
        })
    }

    closeAddingContact(){
        this.middleScreen.next(MiddleScreen.Greeting);
    }

    addContact(contact : IContact){
        this.middleScreen.next(MiddleScreen.Greeting);
    }

    getContacts(): Observable<IContact[]> {
        return Observable.from<IContact[]>(
            this.appService.getContacts()
                .map(contacts => {
                    //this.contacts = contacts;
                    //this.contactsSort();
                    return contacts;
                }
                )
        )

    }

    getAccount(id: number): Observable<IAccount> {
        return Observable.from(
            this.appService.getAccount(id)
                .map(account => { return account; }));
    }

    
    

}
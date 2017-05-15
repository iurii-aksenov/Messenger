import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Observable';
//import 'rxjs/add/operator/fromPromise';
// import 'rxjs/add/operator/catch';
// import 'rxjs/add/observable/throw';
import 'rxjs/Rx';

import { AppService } from './app.service';
import { Contact } from './contact.model';
import { Account } from './account.model';

@Injectable()
export class MiddleService {



    constructor(private appService: AppService) {
    }

    getContacts(): Observable<Contact[]> {
        return Observable.from<Contact[]>(
            Observable.fromPromise(
                this.appService.getContacts()
                    .then(contacts => {
                        //this.contacts = contacts;
                        //this.contactsSort();
                        return contacts;
                    }
                    )
            )
        );
    }

    getAccount(id: number): Observable<Account> {
        return Observable.from(
            this.appService.getAccount(id)
                .map(account => { return account; }));
    }



}
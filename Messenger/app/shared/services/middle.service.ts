import { Injectable, OnDestroy } from '@angular/core';
import { IContact } from "./../models/contact.model";

import { AppService } from "./app.service";
import { Observable } from 'rxjs/Observable';
import { Subscription }   from 'rxjs/Subscription';
import { Subject }   from 'rxjs/Subject';
import 'rxjs/add/observable/from';
import 'rxjs/add/operator/catch';
import 'rxjs/add/observable/throw';
import 'rxjs/add/operator/map';


import { MiddleScreenState } from "../models/middle-screen.enum";

import { Contact } from "./../models/contact.model";
import { IAccount } from "./../models/account.model";

@Injectable()
export class MiddleService{

    private middleScreenState = new Subject<MiddleScreenState>()
    middleScreenState$ = this.middleScreenState.asObservable();

    private interlocutor = new Subject<IContact>();
    interlocutor$ = this.interlocutor.asObservable();

    constructor(private appService: AppService) {
        appService.middleScreenState$.subscribe(middleScreenState =>
        {
            this.middleScreenState.next(middleScreenState);
        })
        appService.intelocutor$.subscribe(interlocutor =>{
            this.interlocutor.next(interlocutor);
        })
    }

    closeAddingContact(){
        this.appService.changeMiddleScreenState(MiddleScreenState.Greeting);
    }

    addContact(contact : Contact){
        this.appService.addContact(contact);
    }

    getContacts(): Observable<Contact[]> {
        return Observable.from<Contact[]>(
            this.appService.getContacts()
                .map(contacts => {
                    //this.contacts = contacts;
                    //this.contactsSort();
                    return contacts;
                }
                )
        )

    }

    getAccount(id: number) {
        
    }

    
    

}
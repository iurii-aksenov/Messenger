import { Injectable } from '@angular/core';
import { Http } from '@angular/http'
import { Response } from '@angular/http'
import { Headers, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { Subject } from 'rxjs/Subject';


import { MiddleScreen } from "../models/middle-screen.enum";
import { Contact } from "../models/contact.model";
import { Account } from "../models/account.model";



@Injectable()
export class AppService {

  private apiUrl = 'api/contacts';
  contacts: Contact[] = [];

  private middleScreen = new Subject<MiddleScreen>();
  middleScreen$ = this.middleScreen.asObservable();

  constructor(private http: Http) {
    this.middleScreen.next(MiddleScreen.Creating);
   }

  changeMiddleScreenOnCreating() {
    this.middleScreen.next(MiddleScreen.Creating);
    console.log(this.middleScreen);
  }

  createContact() {

    let headers = new Headers({ 'Content-Type': 'application/json' });
    let options = new RequestOptions({ headers });
    const body = 5;//= JSON.stringify(contact);

    return this.http.post(this.apiUrl, body, options)
      .map(res => {
        res.json().data;
        console.log(res);
      })
      .catch(this.handleError);


  }

  getContacts(): Observable<Contact[]> {
    return this.http.get(this.apiUrl)
      .map((res: Response) => {
        let contactsList = res.json().data;
        let contacts: Contact[] = [];
        for (let index in contactsList) {
          console.log(contactsList[index]);
          let contact = contactsList[index];
          contacts.push(new Contact(contact.contactId, contact.firstName, contact.secondName, contact.sex, contact.phone, contact.email));
        }
        this.contacts = contacts;
        return (contacts);
      })


  }

  getAccount(id: number): Observable<Account> {
    console.log("http://localhost:57282" + "/contacts/account/" + id);
    return this.http.get('http://localhost:57282/contacts/test/')
      .map((resp: Response) => {
        console.log(resp);
        let accountResp = resp.json();
        console.log(accountResp);
        let account = accountResp;
        return account;
      })
      .catch((error: any) => { console.log(error); return Observable.throw(error); });
  }

  // getContacts(){
  //   return contacts;
  // }

  private handleError(error: any) {
    console.error('Произошла ошибка', error);
    return Promise.reject(error.message || error);
  }

  getContactsFromLocalStorage() {

  }


  

  updateList(): Promise<Contact[]> {
    return this.http.get(this.apiUrl)
      .toPromise()
      .then(res => res.json().data)
      .then(contacts => { //console.log(contacts);  
        return this.contacts = contacts;
      })
      .catch(this.handleError);
  }


}


function supports_html5_storage() {
  try {
    return 'localStorage' in window && window['localStorage'] !== null;
  } catch (e) {
    return false;
  }
}
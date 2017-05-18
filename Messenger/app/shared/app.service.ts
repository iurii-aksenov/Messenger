import { Injectable } from '@angular/core';
import { Http } from '@angular/http'
import { Response } from '@angular/http'
import { Headers, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Observable';

import { Contact } from "./contact.model";
import { Account } from "./account.model";

@Injectable()
export class AppService {

  private apiUrl = 'api/contacts';
  contacts: Contact[] = [];

  constructor(private http: Http) { }

  getContacts(): Promise<Contact[]> {
    return this.http.get(this.apiUrl)
      .toPromise()
      .then(res => res.json().data)
      .then(contacts => { //console.log(contacts);  
        return this.contacts = contacts;
      })
      .catch(this.handleError);

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

  // getContacts(): Observable<Contact[]>{

  //     return this.http.get('app/shared/contacts.json')
  //     .map((resp: Response) => {

  //         let contactsList = resp.json().contacts;
  //         let contacts: Contact[] = [];
  //         for (let index in contactsList) {
  //             console.log(contactsList[index]);
  //             let contact = contactsList[index];
  //             contacts.push(new Contact(
  //                 contact.id,
  //                 contact.firstName,
  //                 contact.lastName,
  //                 contact.gender,
  //                 contact.phone,
  //                 contact.email))
  //         }
  //     return contacts;
  //     })
  //     .catch((error: any)=> {return Observable.throw(error)});
  // }

  createContact(contact: Contact) {


    let headers = new Headers({ 'Content-Type': 'application/json' });
    let options = new RequestOptions({ headers });
    const body = JSON.stringify(contact);

    return this.http.post(this.apiUrl, body, options)
      .map(res => {
        res.json().data;
        console.log(res);
      })
      .catch(this.handleError);


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
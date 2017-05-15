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
        return this.contacts = contacts;})
      .catch(this.handleError);
      
  }

  getAccount(id: number): Observable<Account> {
    return this.http.get("http://localhost:57282"+"/contacts/account/"+id)
    .map((resp:Response)=>{
      let accountResp = resp.json() as Account;
      console.log(accountResp);
      let account = new Account(
        accountResp.id,
        accountResp.password,
        accountResp.firstName,
        accountResp.lastName,
        accountResp.birthdate,
        accountResp.sex,
        accountResp.phone,
        accountResp.email,
        );
      return account;
     });
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




}
function supports_html5_storage() {
  try {
    return 'localStorage' in window && window['localStorage'] !== null;
  } catch (e) {
    return false;
  }
}
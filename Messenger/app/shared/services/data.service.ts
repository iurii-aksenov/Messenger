import { Injectable } from '@angular/core';
import { contacts } from "./../in-memory-data/contact.data";
import { Http } from '@angular/http'
import { Response } from '@angular/http'
import { Headers, RequestOptions } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { Subject } from 'rxjs/Subject';


import { MiddleScreenState } from "../models/middle-screen.enum";
import { Contact } from "../models/contact.model";
import { Account } from "../models/account.model";
import { IContact } from "./../models/contact.model";



@Injectable()
export class AppService {

  private apiUrl = 'api/contacts';

  constructor(private http: Http) {

  }

  
  addContact(contact: IContact) {

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

  getContacts(): Observable<IContact[]> {
    return this.http.get(this.apiUrl)
      .map((res: Response) => {
        let contactsList = res.json().data;
        let contacts: Contact[] = [];

        for (let index in contactsList) {
            
          console.log(contactsList[index]);

          let contact = contactsList[index];         
          contacts.push({
            choosen: false,
            matched: false,
            id: contact.contactId,
            firstName: contact.firstName,
            secondName: contact.secondName,
            sex: contact.sex,
            phone: contact.phone,
            email: contact.email
          } as IContact);
        }
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




  updateList() {

  }


}


function supports_html5_storage() {
  try {
    return 'localStorage' in window && window['localStorage'] !== null;
  } catch (e) {
    return false;
  }
}
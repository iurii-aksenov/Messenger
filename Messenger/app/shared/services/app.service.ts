import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions } from '@angular/http';
import { Response } from '@angular/http'
import { Observable } from 'rxjs/Observable';
import { Subject } from 'rxjs/Subject';


import { MiddleScreen } from "../models/middle-screen.enum";
import { Contact } from "../models/contact.model";
import { Account } from "../models/account.model";
import { IContact } from "./../models/contact.model";



@Injectable()
export class AppService {

  private apiUrl = 'api/contacts/';
  contacts: IContact[] = [];

  private middleScreen = new Subject<MiddleScreen>();
  middleScreen$ = this.middleScreen.asObservable();

  constructor(private http: Http) {
    this.middleScreen.next(MiddleScreen.Creating);
  }

  changeMiddleScreenOnCreating() {
    this.middleScreen.next(MiddleScreen.Creating);
    console.log(this.middleScreen);
  }

  addContact(contact: IContact) {

    console.log(contact);
    console.log(JSON.stringify(contact));

    let headers = new Headers({ 'Content-Type':  'application/json;charset=utf-8'  });
    let options = new RequestOptions({ headers });
    const body = JSON.stringify(contact);

    this.middleScreen.next(MiddleScreen.Greeting);

    this.contacts.push(contact);

    return this.http.post(this.apiUrl, contact, {headers: headers})
      .map((resp:Response)   => {
        let r = resp;
        console.log(r);
      })
  }

  getContacts(): Observable<Contact[]> {
    return this.http.get(this.apiUrl)
      .map((res: Response) => {
        let contactsList = res.json().data;
        for (let index in contactsList) {
          console.log(contactsList[index]);

          let contact = contactsList[index];
          this.contacts.push({
            choosen: false,
            matched: true,
            contactId: contact.id,
            firstName: contact.firstName,
            secondName: contact.secondName,
            sex: contact.sex,
            phone: contact.phone,
            email: contact.email
          } as Contact);

        }
        return (this.contacts);
      })
      .catch(error => {
        this.handleError(error);
        return Observable.throw(error);
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
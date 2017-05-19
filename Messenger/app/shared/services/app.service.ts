import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions } from '@angular/http';
import { Response } from '@angular/http'
import { Observable } from 'rxjs/Observable';
import { Subject } from 'rxjs/Subject';


import { MiddleScreenState } from "../models/middle-screen.enum";
import { Contact } from "../models/contact.model";
import { IAccount } from "../models/account.model";
import { IContact } from "./../models/contact.model";



@Injectable()
export class AppService {

  private apiUrl = 'api/contacts';
  contacts: IContact[] = [];

  private middleScreenState = new Subject<MiddleScreenState>();
  middleScreenState$ = this.middleScreenState.asObservable();

  private interlocutor = new Subject<IContact>();
  intelocutor$ = this.interlocutor.asObservable();


  constructor(private http: Http) {
    this.middleScreenState.next(MiddleScreenState.Creating);
    this.interlocutor.next();
  }


  changeMiddleScreenState(middleScreenState: MiddleScreenState) {
    this.middleScreenState.next(middleScreenState);
    console.log(this.middleScreenState);
  }

  changeInterlocutor(interlocutor: IContact){
    this.interlocutor.next(interlocutor);
  }

  addContact(contact: IContact) {

    this.contacts.push(contact);

    let headers = new Headers({ 'Content-Type':  'application/json;charset=utf-8'  });
    let options = new RequestOptions({ headers });
    const body = JSON.stringify(contact);

    this.changeMiddleScreenState(MiddleScreenState.Greeting);
    return this.http.post(this.apiUrl, contact, options)
      .map((resp:Response)   => {
        resp.json().data;
        
      })
      .catch(this.handleError);
  }

  getContacts(): Observable<IContact[]> {
    return this.http.get(this.apiUrl)
      .map((res: Response) => {
        let contactsList = res.json().data;
        for (let index in contactsList) {

          console.log(contactsList[index]);

          let contact = contactsList[index];
          this.contacts.push({
            choosen: false,
            matched: true,
            id: contact.id,
            firstName: contact.firstName,
            secondName: contact.secondName,
            sex: contact.sex,
            phone: contact.phone,
            email: contact.email
          } as IContact);

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
  
  getMessages(account: IAccount, interlocutor: IContact){

  }

  mailContact(contact: IContact){
    this.changeMiddleScreenState(MiddleScreenState.Messaging);
    this.changeInterlocutor(contact);


  }




  private handleError(error: any) {
    console.error('Произошла ошибка', error);
    return Promise.reject(error.message || error);
  }

  getContactsFromLocalStorage() { }
  updateList() { }
}


function supports_html5_storage() {
  try {
    return 'localStorage' in window && window['localStorage'] !== null;
  } catch (e) {
    return false;
  }
}
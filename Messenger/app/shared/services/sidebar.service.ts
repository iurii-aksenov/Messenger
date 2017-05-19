import { Injectable, OnInit } from '@angular/core';
import { Http, Response } from '@angular/http';

import { Observable } from 'rxjs/Observable';
//import 'rxjs/add/operator/fromPromise';
// import 'rxjs/add/operator/catch';
// import 'rxjs/add/observable/throw';
import 'rxjs/Rx';


import { IContact, Contact } from "../models/contact.model";


import { AppService } from "./app.service";

export class DeltaContact {

    constructor(public index: number, public deltaContact: IContact, public deltaReport: string) { }
}


@Injectable()
export class SidebarService {
    deltaContacts: DeltaContact[] = [new DeltaContact(0, null, "none")];

    contacts: Contact[] = []; //ВЫнести в отдельный сервис, чтобы были отдельные методы для получения записи и проверки. СДелать подобие БД в сервисе с localstorage.
    checkCount: number = 0;
    matchedCount: number;
    isAllChecked: boolean = false;
    searchText: string = "";

    localLanguage: string = "ENG";

    constructor(private appService: AppService) {
        //this.contacts = JSON.parse(localStorage.getItem("ContactsBook.contacts"));;
    }

    //Добавление нового контакта в список контактов для данного аккаунта
    createContact(){
        this.appService.changeMiddleScreenOnCreating();
    }

    //Получение списка контактов для данного аккаунта
    getContacts(): Observable<Contact[]> {
        return Observable.from<Contact[]>(
                this.appService.getContacts()
                    .map(contacts => {
                        this.contacts = contacts;
                        this.contactsSort();
                        return contacts;
                    }
                    
            )
        );
    }

    //Получение Локльного языка, чтобы в функция был или англ по умолчанию или руссский
    getLocalLanguage(): string {
        return this.localLanguage;
    }

    // функция поиска
    //если работает функция поиска то она тменяет выделение все котактов. и в переборе по массиву контактов она 
    //всех делает не выбранными и смотрит совпадение введенного текста и полей контакта с помощью дополнительно вызываемой функции проверки
    search(searchText: string): void {
        this.searchText = searchText;
        this.checkCount = 0;
        this.isAllChecked = false;
        this.contacts.forEach(contact => {
            contact.choosen = false;
            this.isContactMatched(contact);
        });
    }

    //функци смотри совпадение введенного значения в поиск и полей контакта
    isContactMatched(contact: IContact): void {
        if (this.searchText === '' || this.searchText === undefined || this.searchText === null) {
            if (!contact.matched) this.matchedCount++;
            contact.matched = true;
            return;
        }
        if (
            (contact.firstName.toLowerCase().indexOf(this.searchText.toLowerCase()) !== -1) ||
            (contact.secondName.toLowerCase().indexOf(this.searchText.toLowerCase()) !== -1) ||
            (contact.phone.toLowerCase().indexOf(this.searchText.toLowerCase()) !== -1)
        ) {
            if (!contact.matched) this.matchedCount++;
            contact.matched = true;
            return;
        }

        if (contact.matched) this.matchedCount--;
        contact.matched = false;
        return;
    }

    //функция отмечает контакт выбранным, делает его выбранным. и если контакт становится выбранным то увеличивается счетчик выбранных контактов, 
    //иначе счетчки уменьшается. Если их количество равно количество всего массива или количеству совпадающих по поиску то логическое свойство отмеченны все true
    checkContact(contact: IContact): void {
        contact.choosen = !contact.choosen;
        contact.choosen ? this.checkCount++ : this.checkCount--;
        if (this.checkCount === this.contacts.length || this.checkCount === this.matchedCount) {
            this.isAllChecked = true;
        } else {
            this.isAllChecked = false;
        }
    }
    //функция отмечает все контакты или снимает выделение всех контактов
    //если количестов выбранных совпадает с линой всего массива или количеством совпадающих, то тогда все убираются, иначе каждый совпадающий становится выбранным и все становится выбранным
    checkAllContacts(): boolean {
        if (this.checkCount === this.contacts.length || this.checkCount === this.matchedCount) {
            this.contacts.forEach(element => { element.choosen = !element.choosen; });
            this.checkCount = 0;
            this.isAllChecked = false;
            return false;
        }
        else {
            this.contacts.forEach(element => { element.matched ? element.choosen = true : element.choosen = false });
            this.checkCount = this.matchedCount;
            this.isAllChecked = true;
            return true;
        }
    }

    //отправить письмо контакту
    mailContact(contact: IContact): void { }
    //отправить письмо выбранным котактам
    mailMatchedContacts(): void { }
    //позвониить контакты
    phoneContact(contact: IContact): void { }
    //позваонить выьранным котактам
    phoneMatchedContacts(): void { }
    //удалить контакта
    //когла происзодит удаление ктотакта, спрева полтзователя просят подтвердить, далее просматривается весь массив, если у элемента массива совпадает id то далее контакт помещается в массив изменений
    //если котнакт был выбран то количество выбранных уменьшаетя и количество совпдающих тоже становится меньше. и потом из самого массива контактов удаляется этот контакт. 
    //если количество выбранный становится 0, то совйство все ли выбраны становится false
    //происходит выход их цикла, чтобы не проверять весь остальной массив.
    deleteContact(contact: IContact): void {
        if (confirm("Do you want to delete " + contact.firstName + " " + contact.secondName+ "?")) {
            for (let i = 0; i < this.contacts.length; i++) {
                if (this.contacts[i].contactId === contact.contactId) {
                    this.deltaContactPush(this.contacts[i], "delete");
                    if (contact.choosen) {
                        this.checkCount--;
                    }
                    this.matchedCount--;
                    this.contacts.splice(i, 1);
                    if (this.checkCount === 0) this.isAllChecked = false;
                    break;
                }
            }
        }
    }
    //удаление выбанных контактов
    deleteMatchedContacts(): void {
        if (confirm("Do you want to delete ALL CHECKED CONTACTS ?")) {
            while (this.checkCount !== 0) {
                for (let i = 0; i < this.contacts.length; i++) {
                    if (this.contacts[i].choosen) {
                        this.deltaContactPush(this.contacts[i], "delete");
                        this.contacts.splice(i, 1);
                        this.checkCount--;
                        this.matchedCount--;
                        if (this.checkCount === 0) this.isAllChecked = false;
                    }
                }
            }
        }
    }

    //сгруппировать выбранные контакты
    groupMatchedContacts() {

    }
    //сортирует по имень все контакты. 
    //Если параметр имеет значение true то по убыванию, иначе по возрастанию
    sortFirstNameContactsUp(firstNameSortedUp: boolean = true) {
        if (!firstNameSortedUp) {
            this.contacts.sort((a: IContact, b: IContact) => {
                if (a.firstName === b.firstName) {
                    if (a.secondName > b.secondName) return -1;
                    if (a.secondName < b.secondName) return 1;
                }
                if (a.firstName > b.firstName) return -1;
                if (a.firstName < b.firstName) return 1;
            });
            return;
        }
        this.contacts.sort((a: IContact, b: IContact) => {
            if (a.firstName === b.firstName) {
                if (a.secondName > b.secondName) return 1;
                if (a.secondName < b.secondName) return -1;
            }
            if (a.firstName > b.firstName) return 1;
            if (a.firstName < b.firstName) return -1;
        });
    }

    sortSecondNameContactsUp(secondNameSortedUp: boolean = true) {
        if (!secondNameSortedUp) {
            this.contacts.sort((a: IContact, b: IContact) => {
                if (a.secondName === b.secondName) {
                    if (a.firstName > b.firstName) return -1;
                    if (a.firstName < b.firstName) return 1;
                }
                if (a.secondName > b.secondName) return -1;
                if (a.secondName < b.secondName) return 1;
            });
            return;
        }
        this.contacts.sort((a: IContact, b: IContact) => {
            if (a.secondName === b.secondName) {
                if (a.firstName > b.firstName) return 1;
                if (a.firstName < b.firstName) return -1;
            }
            if (a.secondName > b.secondName) return 1;
            if (a.secondName < b.secondName) return -1;
        });
    }



    //функция отмены последнего действия. 
    //1) она убирает поиск, 2) если ыли изменения, то она берет последнее изменение и смотрит, если это было удаление, 
    //то она помещает в массив контактов, так как параметр поиска обнулился, то количество совпадающих становится равно длине массива контактов
    //и потом удаляется из массива изменений послений пункт, то есть всё возвращается на круги своя
    undoChangedContact(): void {
        this.search("");


        if (this.deltaContacts.length > 0) {
            let deltaContact = this.deltaContacts[this.deltaContacts.length - 1];
            if (deltaContact.deltaReport === "delete") {
                deltaContact.deltaContact.choosen = false;
                this.contacts.push(deltaContact.deltaContact);
                this.deltaContacts.splice(this.deltaContacts.length - 1, 1);

                this.matchedCount = this.contacts.length;
            }
        }
        this.contactsSort();
    }
    //функция отправляет в массив изменений новое изменение 
    deltaContactPush(deltaContact: IContact, deltaReport: string): void {
        this.deltaContacts.push(new DeltaContact(1, deltaContact, deltaReport));
    }

    //сортировка контактов сначала по фамилии потом по имени от А до Я
    contactsSort(): void {
        this.contacts.sort((a: IContact, b: IContact) => {
            if (a.secondName === b.secondName) {
                if (a.firstName > b.firstName) return 1;
                if (a.firstName < b.firstName) return -1;
            }
            if (a.secondName > b.secondName) return 1;
            if (a.secondName < b.secondName) return -1;
        });
    }

    updateList(){
        this.contacts.forEach(element => {
            console.log(element);
        });
    }

}
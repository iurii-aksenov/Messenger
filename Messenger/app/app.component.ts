import { Component, Input, OnInit, OnDestroy } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Response } from '@angular/http';

import { IContact } from "./shared/contact.model";




export class Contact implements IContact {
    choosen: boolean = false;
    matched: boolean = true;
    constructor(
        public id: number = -1,
        public firstName: string = '',
        public lastName: string = '',
        public gender: string = 'any',
        public phone: string = '',
        public email: string = '') { }
}
export class DeltaChangesItem {

    constructor(public index: number, public changedContact: IContact, public changesReport: string) { }
}

@Component({
    moduleId: module.id,
    selector: 'app',
    templateUrl: 'app.component.html',
    styleUrls: ['app.component.css']

})
export class AppComponent implements OnDestroy{


     
ngOnDestroy(){
    console.log("Hello");
}

    deltaChanges: DeltaChangesItem[] = [new DeltaChangesItem(0, null, "none")];
    // Это массви будет отправляться на сервер, такм образом при отправке на серер мы не гоняем туда сюда весь массив а передаем только изменения

    hiddenForm: boolean = false;
    checkCount: number = 0;
    contacts: IContact[];
    searchResult: string = '';
    newContact: IContact = new Contact();
    editContact: IContact;
    //TODO
    //Надо изменить чтобы ничег не было там изначально, а чтобы проверять присвоим первое значение массива
    isEdit = false;
    middlePartType: number = 0;


    constructor() {
        this.contacts = [];
    }

 
    hiddenFormToggle(): void {
        this.hiddenForm = !this.hiddenForm;
    }

    chose(contact: IContact): void {
        !contact.choosen ? this.checkCount++ : this.checkCount--;
        contact.choosen = !contact.choosen;
        //console.log(this.checkCount)
    }



    choseAll(): void {
        if (this.checkCount === this.contacts.length) {
            this.checkCount = 0;
            this.contacts.forEach(item => {
                item.choosen = false;
            });
        }
        else {

            this.checkCount = this.contacts.length;
            this.contacts.forEach(item => {
                item.choosen = true;
            });
        }
    }

    addContact() {
        this.middlePartType = 2;
    }
    createContact(): void {
        this.contacts.push(new Contact(this.newContact.id,this.newContact.firstName, this.newContact.lastName,
            this.newContact.gender, this.newContact.phone, this.newContact.email));
        let maxId: number = 0;
        this.contacts.forEach(item => {
            if (item.id > maxId) maxId = item.id;
        });
        this.contacts[this.contacts.length - 1].id = maxId + 1;

        this.deltaChangesPush(this.contacts[this.contacts.length - 1], "add");

    }

    search(): void {

    }

    filter(item: IContact): boolean {
        //console.log(item);
        if (this.searchResult === '' || this.searchResult === undefined || this.searchResult === null) return true;
        if (
            (item.firstName.toLowerCase().indexOf(this.searchResult.toLowerCase()) !== -1) ||
            (item.lastName.toLowerCase().indexOf(this.searchResult.toLowerCase()) !== -1) ||
            (item.phone.toLowerCase().indexOf(this.searchResult.toLowerCase()) !== -1)
        ) return true;
        return false;
    }



    deleteContact(): void {

        if (confirm("Do you want to delete all checked people?")) {
            while (this.checkCount !== 0) {

                for (let i = 0; i < this.contacts.length; i++) {
                    if (this.contacts[i].choosen) {
                        this.deltaChangesPush(this.contacts[i], "delete");
                        //contacts.slice(this.contacts.findIndex(item => item.id === contact.id), 1);
                        this.contacts.splice(i, 1);
                        this.checkCount--;
                        console.log(this.contacts);
                    }
                }
            }
        }
    }

    undoContact(): void {
        for (let i = this.deltaChanges.length - 1; i >= 0; i--) {
            if (this.deltaChanges[i].changesReport === "delete") {
                let deltaContact = this.deltaChanges[i].changedContact;
                deltaContact.choosen = false;
                this.contacts.push(deltaContact);
                this.deltaChanges.splice(i, 1);

                this.contactsSort();

                break;
            }
        }
    }

    deltaChangesPush(changedContact: IContact, changesReport: string): void {

        this.deltaChanges.push(new DeltaChangesItem(1, changedContact, changesReport));
    }

    contactsSort() {
        this.contacts.sort((a: IContact, b: IContact) => {
            if (a.lastName === b.lastName) {
                if (a.firstName > b.firstName) return 1;
                if (a.firstName < b.firstName) return -1;
            }
            if (a.lastName > b.lastName) return 1;
            if (a.lastName < b.lastName) return -1;
        });
    }

    isEditToggle(): void {
        this.isEdit = !this.isEdit;
    }
    watchEditContact(contact: IContact): void {
        this.middlePartType = 1;
        this.editContact = contact;
    }

    seeEditContact(): void {

    }

}

import { Component, Input, OnInit } from '@angular/core';

import { IContact } from '../../../shared/contact.model';
import { SidebarService } from '../../../shared/sidebar.service';


@Component({
    moduleId: module.id,
    selector: 'contacts-list',
    templateUrl: 'contacts-list.component.html',
    styleUrls: ['contacts-list.component.css']
})
export class ContactsListComponent implements OnInit {
     contacts: IContact[];

    constructor(private sidebarService:SidebarService){
        this.contacts=[];
    }

    ngOnInit(){
        // this.sidebarService.getContacts().subscribe(
        //     (contacts) => this.contacts=contacts,
        //     error => { this.error=error; console.log(error);});
        
        //this.contacts=this.sidebarService.getContacts();
        this.sidebarService.getContacts().subscribe(contacts => this.contacts = contacts);
        //this.sidebarService.getContacts().subscribe((data:any)=>this.contacts=data);
    }

    checkContact(contact: IContact): void {
        this.sidebarService.checkContact(contact);
        
    }

    mailContact(contact: IContact){
        this.sidebarService.mailContact(contact);
    }

    phoneContact(contact: IContact){
        this.sidebarService.phoneContact(contact);
    }

    deleteContact(contact: IContact){
        this.sidebarService.deleteContact(contact);
    }

    

}
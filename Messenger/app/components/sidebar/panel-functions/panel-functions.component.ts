//TODO
//Сделать чтобы появление доп меню не залеало за край экрана, то есть сделать с js
//http://plnkr.co/edit/CEYfQIQmvQO45sEveChc?p=preview

import { Component, OnInit } from '@angular/core'


import { IContact } from "../../../shared/contact.model";
import { SidebarService } from "../../../shared/sidebar.service";


@Component({
    moduleId: module.id,
    selector: 'panel-functions',
    templateUrl: 'panel-functions.component.html',
    styleUrls: ['panel-functions.component.css']
})
export class PanelFunctionsComponent implements OnInit {
    isFirstNameSortedUp:boolean =true;
    isLastNameSortedUp:boolean=true;
    
    searchText: string = "";
    localLanguage: string;

    constructor(private sidebarService: SidebarService) {
        this.localLanguage = "";
    }

    ngOnInit() {
        this.localLanguage = this.sidebarService.getLocalLanguage();
    }

    onCheckAllContacts() {
        this.sidebarService.checkAllContacts();
    }

    isAllChecked() {
        return this.sidebarService.isAllChecked;
    }

    onSearch() {
        this.sidebarService.search(this.searchText);
    }

    onClose() {
        this.searchText = "";
        this.sidebarService.search(this.searchText);
    }

    onUndoChangedContact() {
        this.searchText = "";
        this.sidebarService.undoChangedContact();
    }

    onMailMatchedContacts() {
        this.sidebarService.mailMatchedContacts();
    }

    onPhoneMatchedContacts() {
        this.sidebarService.phoneMatchedContacts();
    }

    onGroupMatchedContacts() {
        this.sidebarService.groupMatchedContacts();
    }

    onDeleteMatchedContacts() {
        this.sidebarService.deleteMatchedContacts();
    }

    onSortFirstNameContactsUp() {
        this.sidebarService.sortFirstNameContactsUp(this.isFirstNameSortedUp);
        this.isFirstNameSortedUp = !this.isFirstNameSortedUp;
        this.isLastNameSortedUp = true;
    }

    onSortLastNameContactsUp() {
        this.sidebarService.sortLastNameContactsUp(this.isLastNameSortedUp);
        this.isLastNameSortedUp = !this.isLastNameSortedUp;
        this.isFirstNameSortedUp = true;
    }

}
import { Component, Input, Output, EventEmitter } from '@angular/core';

import { IContact } from '../../../shared/contact.model';
import { DisplayDirective } from '../../../shared/display.directive';

import { Observable } from 'rxjs/Observable';

const Rx = require('rxjs/Rx');



@Component({
    moduleId: module.id,
    selector: 'contact-item',
    templateUrl: 'contact-item.component.html',
    styleUrls: ['contact-item.component.css']
})
export class ContactItemComponent {
    @Input() contact: IContact;

    @Output() checkContact = new EventEmitter<IContact>();
    @Output() mailContact = new EventEmitter<IContact>();
    @Output() phoneContact = new EventEmitter<IContact>();
    @Output() deleteContact = new EventEmitter<IContact>();


    //Отметить контакт
    onCheckContact(): void {
        this.checkContact.emit(this.contact);
    }

    onMailDleteContact(){
        this.mailContact.emit(this.contact);
    }

    onPhoneContact(){
        this.phoneContact.emit(this.contact);
    }

    onDeleteContact(){
        this.deleteContact.emit(this.contact);
    }

    //TODO исправить посылку не весь объект а только его 
    //id  - то есть применить или отменить выбор данного объекта


}
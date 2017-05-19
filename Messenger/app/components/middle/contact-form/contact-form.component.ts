import { Component, EventEmitter, Output } from '@angular/core';
import { IContact } from "./../../../shared/models/contact.model";
import { FormGroup, FormControl, Validators } from '@angular/forms';


import { Contact } from '../../../shared/models/contact.model';

@Component({
    moduleId: module.id,
    selector: 'contact-form',
    templateUrl: 'contact-form.component.html',
    styleUrls: ['contact-form.component.css']
})
export class ContactFormComponent {
    contactForm: FormGroup

    @Output() add: EventEmitter<Contact​​> = new EventEmitter<Contact>();
    @Output() close: EventEmitter<boolean> = new EventEmitter<boolean>();

    constructor() {
        this.contactForm = new FormGroup({
            "contactFirstName": new FormControl("", [Validators.required, this.contactNameValidator]),
            "contactSecondName": new FormControl(""),
            "contactPhone": new FormControl(""),
            "contactEmail": new FormControl("")
        });
    }



    // onCreateContact() {
    //     this.middleService.createContact(new Contact(
    //         this.contactForm.controls['contactFirstName'].value,
    //         this.contactForm.controls['contactSecondName'].value,
    //         this.contactForm.controls['contactPhone'].value,
    //         this.contactForm.controls['contactEmail'].value))
    //        .subscribe((data) => {console.log(data)});
    // }

    contactNameValidator(control: FormControl): { [s: string]: boolean } {
        if (control.value === "нет") {
            return { "contactFirstName": true };
        }
        return null;
    }

    onAddContact() {
        let contact = new Contact(
            this.contactForm.controls['contactFirstName'].value,
            this.contactForm.controls['contactSecondName'].value,
            'ANY',
            this.contactForm.controls['contactPhone'].value,
            this.contactForm.controls['contactEmail'].value)
        console.log(contact)

        this.add.emit(contact);
    };

    onCloseAddContact() {
        this.close.emit(true);
    }

}
import { Component, EventEmitter, Output } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';

import { MiddleService } from '../../../shared/services/middle.service';
import { Contact } from '../../../shared/models/contact.model';

@Component({
    moduleId: module.id,
    selector: 'contact-form',
    templateUrl: 'contact-form.component.html',
    styleUrls: ['contact-form.component.css']
})
export class ContactFormComponent {

    constructor(private middleService: MiddleService) { }

    contactForm: FormGroup = new FormGroup({
        "contactFirstName": new FormControl("", [Validators.required, this.contactNameValidator]),
        "contactSecondName": new FormControl(""),
        "contactPhone": new FormControl(""),
        "contactEmail": new FormControl("")
    });

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

}
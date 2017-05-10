import { Component, EventEmitter, Output } from '@angular/core';
import { FormGroup, FormControl, Validators} from '@angular/forms';

import { MiddleService } from '../../../shared/middle.service';
import { Contact } from '../../../shared/contact.model';

@Component({
    moduleId: module.id,
    selector: 'contact-form',
    templateUrl: 'contact-form.component.html',
    styleUrls:['contact-form.component.css']
})
export class ContactFormComponent {

    constructor(private middleService: MiddleService){}

    contactForm: FormGroup = new FormGroup({
        "contactFirstName": new  FormControl("", [Validators.required, this.contactNameValidator]),
        "contactSecondName": new FormControl("")
    });

    onCreateContact(){
        //this.middleService.createContact(new Contact(this.contactForm;
        console.log("Hello");
        console.log(this.contactForm.value['contactFirstName']);
        
    }

    contactNameValidator(control: FormControl): {[s:string]:boolean}{
        if(control.value === "нет"){
            return {"contactFirstName":true};
        }
        return null;
    }

}
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Observable';
//import 'rxjs/add/operator/fromPromise';
// import 'rxjs/add/operator/catch';
// import 'rxjs/add/observable/throw';
import 'rxjs/Rx';

import { AppService} from './app.service';
import { Contact } from './contact.model';

@Injectable()
export class MiddleService {

    constructor(private appService: AppService){
    }

}
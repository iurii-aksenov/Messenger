export interface IContact {
    contactId: number;
    choosen: boolean;
    matched: boolean;
    firstName: string;
    secondName: string;
    sex: string;
    phone: string;
    email: string;
}

export class Contact implements IContact {
    choosen: boolean = false;
    matched: boolean = true;
    constructor(
        public contactId: number,
        public firstName: string,
        public secondName: string = '',
        public sex: string = 'any',
        public phone: string,
        public email: string = '') { }
}
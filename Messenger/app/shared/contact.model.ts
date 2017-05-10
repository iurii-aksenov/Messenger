export interface IContact {
    id: number;
    choosen: boolean;
    matched: boolean;
    firstName: string;
    lastName: string;
    gender: string;
    phone: string;
    email: string;
}

export class Contact implements IContact {
    choosen: boolean = false;
    matched: boolean = true;
    id: number;
    constructor(
        public firstName: string = '',
        public lastName: string = '',
        public gender: string = 'any',
        public phone: string = '',
        public email: string = '') { }
}
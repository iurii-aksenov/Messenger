export interface IAccount {
    accountId: number;
    choosen: boolean;
    matched: boolean;
    firstName: string;
    lastName: string;
    birthdate: Date;
    sex: string;
    phone: string;
    password: string;
    email: string;
}

export class Account implements IAccount {
    choosen: boolean = false;
    matched: boolean = true;
    accountId: number;
    constructor(
        public password: string,
        public firstName: string = '',
        public lastName: string = '',
        public birthdate: Date = null,
        public sex: string = 'any',
        public phone: string = '',
        public email: string = '') { }
}
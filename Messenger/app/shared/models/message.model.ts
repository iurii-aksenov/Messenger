export interface IMessage {
    messageId: number;
    owner: string;
    interlocitor: string;
    test: string;
}

export class Message implements IMessage {
    constructor(
        public messageId: number,
        public owner: string,
        public interlocitor: string,
        public test: string) { }
}
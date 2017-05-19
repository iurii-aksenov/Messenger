export interface IMessage {
    id: number;
    authorId: number;
    text: string;
}

export class Message implements IMessage {
    public id: number;
    constructor(
        public authorId: number,
        public text: string) { }
}
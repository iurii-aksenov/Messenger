import { InMemoryDbService } from 'angular-in-memory-web-api';
import 'rxjs/add/operator/toPromise';



export class InMemoryDataService implements InMemoryDbService {

    createDb() {

        const contacts = [
            {
                id: 1,
                choosen: false,
                matched: true,
                firstName: "Иосиф",
                lastName: "Попрыгун",
                gender: "man",
                phone: "72566898599",
                email: "hello@mail.com"

            },
            {
                id: 2,
                choosen: false,
                matched: true,
                firstName: "Смурфик",
                lastName: "Синеглазик",
                gender: "man",
                phone: "72566898599",
                email: "hello@mail.com"
            },
            {
                id: 3,
                choosen: false,
                matched: true,
                firstName: "Бельчонок",
                lastName: "Пушистик",
                gender: "woman",
                phone: "72566898599",
                email: "hello@mail.com"
            },
            {
                id: 4,
                choosen: false,
                matched: true,
                firstName: "Шарик",
                lastName: "Иподромов",
                gender: "man",
                phone: "72566898599",
                email: "hello@mail.com"
            },
            {
                id: 5,
                choosen: false,
                matched: true,
                firstName: "Ариэль",
                lastName: "Герц",
                gender: "woman",
                phone: "72566898599",
                email: "hello@mail.com"
            }

        ];
        return { contacts: contacts };

    }
}

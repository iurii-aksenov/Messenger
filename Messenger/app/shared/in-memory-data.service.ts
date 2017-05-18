import { InMemoryDbService } from 'angular-in-memory-web-api';
import 'rxjs/add/operator/toPromise';



export class InMemoryDataService implements InMemoryDbService {

    createDb() {

        const contacts = [
            {

                contactId: 1,
                choosen: false,
                matched: true,
                firstName: "Оксана",
                secondName: "Ежакова",
                middleName: "Федоровна",
                sex: "WOMAN",
                phone: "89001805101",
                email: "spell@yandex.ru",
                password: "01"

            },
            {
                contactId: 2,
                choosen: false,
                matched: true,
                firstName: "Сергей",
                secondName: "Поляков",
                middleName: "Александрович",
                sex: "MAN",
                phone: "89001805102",
                email: "curse@yandex.ru",
                password: "02"
            },
            {
                contactId: 3,
                choosen: false,
                matched: true,
                firstName: "Станислав",
                secondName: "Конеев",
                middleName: "Ларионович",
                sex: "MAN",
                phone: "89001805103",
                email: "district@yandex.ru",
                password: "03"
            },
            {
                contactId: 4,
                choosen: false,
                matched: true,
                firstName: "Андрей",
                secondName: "Косицин",
                middleName: "Валерьевич",
                sex: "MAN",
                phone: "89001805104",
                email: "lady@yandex.ru",
                password: "04"
            },
            {
                contactId: 5,
                choosen: false,
                matched: true,
                firstName: "Александр",
                secondName: "Лисица",
                middleName: "Робертович",
                sex: "MAN",
                phone: "89001805105",
                email: "treat@yandex.ru",
                password: "05"
            },
            {
                contactId: 12,
                choosen: false,
                matched: true,
                firstName: "Роман",
                secondName: "Хрулиндиков",
                middleName: "Гибадулович",
                sex: "MAN",
                phone: "89001805112",
                email: "heel@yandex.ru",
                password: "12"
            }

        ];
        return { contacts: contacts };

    }
}

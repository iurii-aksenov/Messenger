import { InMemoryDbService } from 'angular-in-memory-web-api';
import 'rxjs/add/operator/toPromise';



export class InMemoryDataService implements InMemoryDbService {

    createDb() {

        const contacts = [
            {

                id: 1,
                choosen: false,
                matched: true,
                firstName: "Оксана",
                lastName: "Ежакова",
                middleName: "Федоровна",
                sex: "WOMAN",
                phone: "89001805101",
                email: "spell@yandex.ru",
                password: "01"

            },
            {
                id: 2,
                choosen: false,
                matched: true,
                firstName: "Сергей",
                lastName: "Поляков",
                middleName: "Александрович",
                sex: "MAN",
                phone: "89001805102",
                email: "curse@yandex.ru",
                password: "02"
            },
            {
                id: 3,
                choosen: false,
                matched: true,
                firstName: "Станислав",
                lastName: "Конеев",
                middleName: "Ларионович",
                sex: "MAN",
                phone: "89001805103",
                email: "district@yandex.ru",
                password: "03"
            },
            {
                id: 4,
                choosen: false,
                matched: true,
                firstName: "Андрей",
                lastName: "Косицин",
                middleName: "Валерьевич",
                sex: "MAN",
                phone: "89001805104",
                email: "lady@yandex.ru",
                password: "04"
            },
            {
                id: 5,
                choosen: false,
                matched: true,
                firstName: "Александр",
                lastName: "Лисица",
                middleName: "Робертович",
                sex: "MAN",
                phone: "89001805105",
                email: "treat@yandex.ru",
                password: "05"
            },
            {
                id: 12,
                choosen: false,
                matched: true,
                firstName: "Роман",
                lastName: "Хрулиндиков",
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

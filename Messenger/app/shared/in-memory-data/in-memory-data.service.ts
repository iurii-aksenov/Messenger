import { InMemoryDbService } from 'angular-in-memory-web-api';



export class InMemoryDataService implements InMemoryDbService {

    createDb() {

        const contacts = [
            {

                id: 1,
                firstName: "Оксана",
                secondName: "Ежакова",
                middleName: "Федоровна",
                sex: "WOMAN",
                phone: "89001805101",
                email: "spell@yandex.ru",
                password: "01"

            },
            {
                id: 2,
                firstName: "Сергей",
                secondName: "Поляков",
                middleName: "Александрович",
                sex: "MAN",
                phone: "89001805102",
                email: "curse@yandex.ru",
                password: "02"
            },
            {
                id: 3,
                firstName: "Станислав",
                secondName: "Конеев",
                middleName: "Ларионович",
                sex: "MAN",
                phone: "89001805103",
                email: "district@yandex.ru",
                password: "03"
            },
            {
                id: 4,
                firstName: "Андрей",
                secondName: "Косицин",
                middleName: "Валерьевич",
                sex: "MAN",
                phone: "89001805104",
                email: "lady@yandex.ru",
                password: "04"
            },
            {
                id: 5,
                firstName: "Александр",
                secondName: "Лисица",
                middleName: "Робертович",
                sex: "MAN",
                phone: "89001805105",
                email: "treat@yandex.ru",
                password: "05"
            }

        ];
        return { contacts: contacts };

    }
}

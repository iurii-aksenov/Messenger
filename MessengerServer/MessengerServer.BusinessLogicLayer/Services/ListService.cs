using MessengerServer.BusinessLogicLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MessengerServer.BusinessLogicLayer.DataTransferObjects;
using MessengerServer.DataAccessLayer.Interfaces;
using MessengerServer.DataAccessLayer.EntityFramework;
using MessengerServer.BusinessLogicLayer.Infrastructure;
using AutoMapper;

namespace MessengerServer.BusinessLogicLayer.Services
{
    public class ListService : IListService
    {
        IUnitOfWork Database { get; set; }

        public ListService(IUnitOfWork uow)
        {
            Database = uow;
        }

        public void CreateListByAccount(ListDTO listDTO, AccountDTO accountDTO)
        {
            Contact account = Database.Contacts.Get(accountDTO.AccountId);
            if (account == null)
                throw new ValidationException("Аккаунт не найден", "");

            List list = Database.Lists.Get(listDTO.ListId); ;

            if (list != null)
                throw new ValidationException("Список контактов уже существует", "");

            list = new List
            {
                Title="CONTACTS",
                CreatorId = account.ContactId
            };
            Database.Lists.Create(list);
            Database.Save();

            InsertContactsIntoListByAccount(listDTO.Contacts, accountDTO);
        }

        public void InsertContactsIntoListByAccount(IEnumerable<ContactDTO> contactsDTO, AccountDTO accountDTO)
        {
            Contact account = Database.Contacts.Get(accountDTO.AccountId);
            if (account == null)
                throw new ValidationException("Аккаунт не найден", "");
            List list = Database.Lists.Get(Database.Lists.Find(l=>((l.Title == "CONTACTS") && (l.CreatorId == account.ContactId))).FirstOrDefault().ListId);
            if (list == null)
                throw new ValidationException("Список контактов не найден", "");

            foreach (var contactDTO in contactsDTO)
            {
                ListContact listContact = new ListContact
                {
                    ListId  =list.ListId,
                    ContactId = contactDTO.ContactId
                };

                Database.ListContacts.Create(listContact);
            }

            Database.Save();
        }


        public ListDTO GetListByAccount(int? accountId)
        {
            if(accountId == null)
                throw new ValidationException("Id контакта не установлен.", "");

            Contact account = Database.Contacts.Get((int)accountId);
            if (account == null)
                throw new ValidationException("Аккаунт не найден.","");

            List list = Database.Lists.Get(Database.Lists.Find(l=>((l.Title == "CONTACTS") && (l.CreatorId == account.ContactId))).FirstOrDefault().ListId);
            if (list == null)
                throw new ValidationException("Список контактов не найден", "");

            IEnumerable<int> contactsIds = Database.ListContacts.Find(lc=>lc.ListId==list.ListId).Select(c=>c.ContactId);
            List<Contact> contacts = new List<Contact>();
            foreach (var contactId in contactsIds)
            {
                contacts.Add(Database.Contacts.Get(contactId));
            }

            contacts.Add(new Contact { ContactId = 55, Phone = "888" });

            Mapper.Initialize(cfg => cfg.CreateMap<Contact, ContactDTO>());
            var contactsDTO = Mapper.Map<List<Contact>, IEnumerable<ContactDTO>>(contacts);

            var listDTO = new ListDTO
            {
                ListId = list.ListId,
                ModificationDate = list.ModificationDate,
                NotRelevant = list.NotRelevant,
                Contacts = contactsDTO
            };
            
            return listDTO;
        }


        public void DeleteContactsFromListByAccount(IEnumerable<ContactDTO> contactsDTO, AccountDTO accountDTO)
        {
            Contact account = Database.Contacts.Get(accountDTO.AccountId);
            if (account == null)
                throw new ValidationException("Аккаунт не найден.", "");

            List list = Database.Lists.Get(Database.Lists.Find(l=>((l.Title == "CONTACTS") && (l.CreatorId == account.ContactId))).FirstOrDefault().ListId);
            if (list == null)
                throw new ValidationException("Список контактов не найден", "");

           
            foreach (var contact in contactsDTO)
            {
                Database.ListContacts.Delete(Database.ListContacts.Find(lc => lc.ListId == list.ListId && lc.ContactId == contact.ContactId).FirstOrDefault().ListContactId);
            }
            Database.Save();
        }

        public void DeleteList(ListDTO listDTO)
        {
            List list = Database.Lists.Get(listDTO.ListId);
            if (list == null)
                throw new ValidationException("Список контактов не найден", "");
            IEnumerable<int> deletedList = Database.ListContacts.Find(lc=>lc.ListId == list.ListId).Select(dl=>dl.ContactId);
            foreach (var deletedItem in deletedList)
            {
                Database.ListContacts.Delete(deletedItem);
            }

            Database.Lists.Delete(list.ListId);

            Database.Save();
        }

        public void Dispose()
        {
            Database.Dispose();
        }

        public void DeleteList(AccountDTO accountDTO)
        {
            throw new NotImplementedException();
        }
    }
}

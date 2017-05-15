using MessengerServer.BusinessLogicLayer.Interfaces;
using MessengerServer.DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MessengerServer.BusinessLogicLayer.DataTransferObjects;
using MessengerServer.BusinessLogicLayer.Infrastructure;
using AutoMapper;
using MessengerServer.DataAccessLayer.EntityFramework;

namespace MessengerServer.BusinessLogicLayer.Services
{
    public class ContactService : IContactService
    {
        IUnitOfWork Database { get; set; }

        public ContactService(IUnitOfWork uow)
        {
            Database = uow;
        }

        public AccountDTO GetAccount(int? id)
        {
            if (id == null)
                throw new ValidationException("Не установлено id аккаунта", "");
            var account = Database.Contacts.Get(id.Value);
            if (account == null)
                throw new ValidationException("Аккаунт не найден", "");

            Mapper.Initialize(cfg => cfg.CreateMap<Contact, AccountDTO>().ForMember("AccountId",opt=>opt.MapFrom(src=>src.ContactId)));
            return Mapper.Map<Contact, AccountDTO>(account);
        }

        public AccountDTO GetAccount(string phone, string password)
        {
            if (String.IsNullOrWhiteSpace(phone) )
                throw new ValidationException("Не установлен телефон", "");

            if (String.IsNullOrWhiteSpace(password))
                throw new ValidationException("Не установлен пароль", "");


            var account = Database.Contacts.Find(a=>a.Phone == phone && a.Password == password).FirstOrDefault();
            if (account == null)
                throw new ValidationException("Аккаунт не найден", "");

            Mapper.Initialize(cfg => cfg.CreateMap<Contact, AccountDTO>().ForMember("AccountId", opt => opt.MapFrom(src => src.ContactId)));
            return Mapper.Map<Contact, AccountDTO>(account);
        }

        public ContactDTO GetContact(int? id)
        {
            if (id == null)
                throw new ValidationException("Не установлено id контакта", "");
            var contact = Database.Contacts.Get(id.Value);
            if (contact == null)
                throw new ValidationException("Контакт не найден", "");

            Mapper.Initialize(cfg => cfg.CreateMap<Contact, ContactDTO>());
            return Mapper.Map<Contact, ContactDTO>(contact);
        }

        public ContactDTO GetContact(string phone)
        {
            if (String.IsNullOrWhiteSpace(phone))
                throw new ValidationException("Не установлен телефон контакта", "");
            var contact = Database.Contacts.Find(c=>c.Phone == phone).FirstOrDefault();
            if (contact == null)
                throw new ValidationException("Контакт не найден", "");

            Mapper.Initialize(cfg => cfg.CreateMap<Contact, ContactDTO>());
            return Mapper.Map<Contact, ContactDTO>(contact);
        }

        public void RegisterAccount(AccountDTO account)
        {
            Mapper.Initialize(cfg => cfg.CreateMap<AccountDTO, Contact>());
            Database.Contacts.Create(Mapper.Map<AccountDTO, Contact>(account));
            Database.Save();
        }

        public void UpdateAccount(AccountDTO account)
        {
            if(Database.Contacts.Get(account.AccountId) == null)
                throw new ValidationException("Аккаунт не найден", "");
            Mapper.Initialize(cfg => cfg.CreateMap<AccountDTO, Contact>());
            Database.Contacts.Update(Mapper.Map<AccountDTO, Contact>(account));
        }

        public void DeleteAccount(AccountDTO account)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            Database.Dispose();
        }

        
    }
}

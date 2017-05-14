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

        public void DeleteAccount(AccountDTO account)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            Database.Dispose();
        }

        public AccountDTO GetAccount(int? id)
        {
            if (id == null)
                throw new ValidationException("Не установлено id аккаунта", "");
            var account = Database.Contacts.Get(id.Value);
            if (account == null)
                throw new ValidationException("Аккаунт не найден", "");

            Mapper.Initialize(cfg => cfg.CreateMap<Contact, AccountDTO>());
            return Mapper.Map<Contact, AccountDTO>(account);
        }

        public ContactDTO GetContact(int? id)
        {
            if (id == null)
                throw new ValidationException("Не установлено id контакта", "");
            var contact = Database.Contacts.Get(id.Value);
            if (contact == null)
                throw new ValidationException("Контакт не найден", "");

            Mapper.Initialize(cfg => cfg.CreateMap<Contact, AContactDTO>());
            return Mapper.Map<Contact, ContactDTO>(contact);
        }

        public void RegisterAccount(AccountDTO account)
        {
            throw new NotImplementedException();
        }
    }
}

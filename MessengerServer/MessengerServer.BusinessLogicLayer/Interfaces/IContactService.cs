using MessengerServer.BusinessLogicLayer.DataTransferObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MessengerServer.BusinessLogicLayer.Interfaces
{
    public interface IContactService
    {
        void RegisterAccount(AccountDTO account);
        ContactDTO GetContact(int? id);
        ContactDTO GetContact(string phone);
        AccountDTO GetAccount(int? id);
        AccountDTO GetAccount(string phone, string password);
        void UpdateAccount(AccountDTO account);
        void DeleteAccount(AccountDTO account);
        void Dispose();
    }
}

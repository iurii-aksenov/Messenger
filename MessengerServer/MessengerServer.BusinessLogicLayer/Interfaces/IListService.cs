using MessengerServer.BusinessLogicLayer.DataTransferObjects;
using MessengerServer.DataAccessLayer.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MessengerServer.BusinessLogicLayer.Interfaces
{
    public interface IListService
    {
        void CreateListByAccount(ListDTO listDTO, AccountDTO accountDTO);
        void InsertContactsIntoListByAccount(IEnumerable<ContactDTO> contactsDTO, AccountDTO accountDTO);
        //ListDTO GetListByAccount(AccountDTO accountDTO);
        ListDTO GetListByAccount(int? accountId);
        void DeleteContactsFromListByAccount(IEnumerable<ContactDTO> contactsDTO, AccountDTO accountDTO);
        void DeleteList(ListDTO listDTO);
        void DeleteList(AccountDTO accountDTO);
        void Dispose();
    }
}

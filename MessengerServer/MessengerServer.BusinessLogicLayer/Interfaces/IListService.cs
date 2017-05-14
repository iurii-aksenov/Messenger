using MessengerServer.BusinessLogicLayer.DataTransferObjects;
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
        IEnumerable<ContactDTO> GetContactsFromListByAccount(AccountDTO accountDTO);
        void DeleteContactsFromListByAccount(IEnumerable<ContactDTO> contactsDTO, AccountDTO accountDTO);
        void DeleteList(ListDTO listDTO);
    }
}

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
        void CreateList(ListDTO listDTO);
        void InsertContactsIntoList(IEnumerable<ContactDTO> contactsDTO);
        IEnumerable<ContactDTO> GetContactsFromListByAccount(ContactDTO contactDTO, AccountDTO accountDTO);
        void DeleteContactFromListByAccount(ContactDTO contactDTO);
        void DeleteContactsFromListByAccount(List<ContactDTO> contactsDTO, AccountDTO);
        void DeleteList(ListDTO listDTO);
    }
}

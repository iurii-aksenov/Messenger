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
        void CreateListOfContacts(ListOfContactsDTO listOfContactsDTO);
        void InsertContactsIntoListOfContacts(IEnumerable<ContactDTO> listOfContacts);
        IEnumerable<ContactDTO> GetContactFromListOfContactsByContact(ContactDTO);
        void DeleteContactFromListOfContactByContact(ContactDTO listContactDTO);
        void DeleteContactsFromListOfContactsByContact(List<ContactDTO> listContactDTO);
        void DeleteListOfContacts(ListOfContactsDTO listOfContactsDTO);
    }
}

using MessengerServer.DataAccessLayer.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MessengerServer.DataAccessLayer.Interfaces
{
    public interface IListRepository : IRepository<List>
    {
        List Get(string title, int creatorId);
        int? GetId(string title, int contactId);
        List<Contact> GetListOfContactsByContactId(int contactId);
        List<int> GetListOfContactsIdByContactId(int contactId);
        
    }
}

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
        int? GetListIdByTitleAndContactId(string title, int contactId);
        List<Contact> GetListOfFriendsByContactId(int contactId);
        List<int> GetListOfFriendsIdByContactId(int contactId);
        List<Contact> GetListOfSomeonesByTitleAndContactId(string title, int contactId);
        List<int> GetListOfSomeonesIdByTitleAndContactId(string title, int contactId);
    }
}

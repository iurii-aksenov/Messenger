using MessengerServer.DataAccessLayer.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MessengerServer.DataAccessLayer.Interfaces
{
    public interface IListContactRepository : IRepository<ListContact>
    {
        int? GetId(int listId, int ContactId);
        int GetTheQuantityFriendsOfContact(int contactId);
    }
}

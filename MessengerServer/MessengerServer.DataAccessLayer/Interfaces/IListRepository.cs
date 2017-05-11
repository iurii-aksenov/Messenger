﻿using MessengerServer.DataAccessLayer.EntityFramework;
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
        List<Contact> GetListOfFriendsByContactId(int contactId);
        List<int> GetListOfFriendsIdByContactId(int contactId);
        List<Contact> GetListOfSomeonesByTitleAndContactId(int contactId);
        List<int> GetListOfSomeonesIdByTitleAndContactId(int contactId);
    }
}

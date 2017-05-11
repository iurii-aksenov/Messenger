using MessengerServer.DataAccessLayer.EntityFramework;
using MessengerServer.DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MessengerServer.DataAccessLayer.Repositories
{
    public class ListRepository : IListRepository
    {
        private MessengerContext db;

        public ListRepository(MessengerContext context)
        {
            this.db = context;
        }

        public void Create(List item)
        {
            

        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<List> Find(Func<List, bool> predicate)
        {
            throw new NotImplementedException();
        }

        public List Get(int id)
        {
            throw new NotImplementedException();
        }

        public List Get(string title, int creatorId)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<List> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Contact> GetListOfFriendsByContactId(int contactId)
        {
            throw new NotImplementedException();
        }

        public List<int> GetListOfFriendsIdByContactId(int contactId)
        {
            throw new NotImplementedException();
        }

        public List<Contact> GetListOfSomeonesByTitleAndContactId(int contactId)
        {
            throw new NotImplementedException();
        }

        public List<int> GetListOfSomeonesIdByTitleAndContactId(int contactId)
        {
            throw new NotImplementedException();
        }

        public void Update(List item)
        {
            throw new NotImplementedException();
        }
    }
}

using MessengerServer.DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MessengerServer.DataAccessLayer.EntityFramework;

namespace MessengerServer.DataAccessLayer.Repositories
{
    public class ListContactRepository : IListContactRepository
    {
        public void Create(ListContact item)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<ListContact> Find(Func<ListContact, bool> predicate)
        {
            throw new NotImplementedException();
        }

        public ListContact Get(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<ListContact> GetAll()
        {
            throw new NotImplementedException();
        }

        public int GetListContactIdByListIdAndContactId(int listId, int ContactId)
        {
            throw new NotImplementedException();
        }

        public void Update(ListContact item)
        {
            throw new NotImplementedException();
        }
    }
}

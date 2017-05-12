using MessengerServer.DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MessengerServer.DataAccessLayer.EntityFramework;

namespace MessengerServer.DataAccessLayer.Repositories
{
    public class DialogRepository : IDialogRepository
    {
        public void Create(Dialog item)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Dialog> Find(Func<Dialog, bool> predicate)
        {
            throw new NotImplementedException();
        }

        public Dialog Get(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Dialog> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Dialog> GetDialogsOfContactId(int contactId)
        {
            throw new NotImplementedException();
        }

        public void Update(Dialog item)
        {
            throw new NotImplementedException();
        }
    }
}

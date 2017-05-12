using MessengerServer.DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MessengerServer.DataAccessLayer.EntityFramework;

namespace MessengerServer.DataAccessLayer.Repositories
{
    public class DialogMessageRepository : IDialogMessageRepository
    {
        public void Create(DialogMessage item)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<DialogMessage> Find(Func<DialogMessage, bool> predicate)
        {
            throw new NotImplementedException();
        }

        public DialogMessage Get(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<DialogMessage> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Update(DialogMessage item)
        {
            throw new NotImplementedException();
        }
    }
}

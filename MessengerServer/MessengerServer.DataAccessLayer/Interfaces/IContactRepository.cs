using MessengerServer.DataAccessLayer.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MessengerServer.DataAccessLayer.Interfaces
{
    public interface IContactRepository : IRepository<Contact>
    {
        Contact GetContactByEmail(string email);
        int GetContactIdByEmail(string email);
    }
}

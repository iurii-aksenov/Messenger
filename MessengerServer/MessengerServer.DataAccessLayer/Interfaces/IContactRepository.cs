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
        Contact GetByPhone(string phone);
        Contact GetByEmail(string email);
        int? GetIdByEmail(string email);
        int? GetIdByPhone(string phone);
    }
}

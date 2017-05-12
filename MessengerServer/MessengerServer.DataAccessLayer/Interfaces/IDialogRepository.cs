using MessengerServer.DataAccessLayer.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MessengerServer.DataAccessLayer.Interfaces
{
    public interface IDialogRepository : IRepository<Dialog>
    {
        List<Dialog> GetDialogsOfContactId(int contactId);
    }
}

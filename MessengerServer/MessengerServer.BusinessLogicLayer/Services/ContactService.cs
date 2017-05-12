using MessengerServer.BusinessLogicLayer.Interfaces;
using MessengerServer.DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MessengerServer.BusinessLogicLayer.Services
{
    public class ContactService : IContactService
    {
        IUnitOfWork Database { get; set; }
    }
}

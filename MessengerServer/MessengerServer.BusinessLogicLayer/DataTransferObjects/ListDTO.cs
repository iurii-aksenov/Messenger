using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MessengerServer.BusinessLogicLayer.DataTransferObjects
{
    public class ListDTO
    {
        public int ListId { get; set; }
        public DateTime ModificationDate { get; set; } = DateTime.Now;
        public bool NotRelevant { get; set; } = false;

        public ICollection<ContactDTO> Contacts { get; set; }
    }
}

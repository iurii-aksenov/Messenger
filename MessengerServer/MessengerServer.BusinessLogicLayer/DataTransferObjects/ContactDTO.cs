using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MessengerServer.BusinessLogicLayer.DataTransferObjects
{
    public class ContactDTO
    {
        public int ContactId { get; set; }
        public string FirstName { get; set; }
        public string SecondName { get; set; }
        public string MiddleName { get; set; }
        public string Sex { get; set; }
        public DateTime? BirthDate { get; set; }
        public string Email { get; set; }
        public string Comment { get; set; }
        public DateTime CreationDate { get; set; }
        public bool Disable { get; set; } = false;
        public bool NotRelevant { get; set; } = false;
    }
}

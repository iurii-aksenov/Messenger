using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MessengerServer.PresentationLayer.Models
{
    public class AccountViewModel
    {
        public int AccountId { get; set; }
        public string FirstName { get; set; }
        public string SecondName { get; set; }
        public string MiddleName { get; set; }
        public string Sex { get; set; }
        public DateTime? BirthDate { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Password { get; set; }
        public DateTime CreationDate { get; set; }
        public bool Disable { get; set; } = false;
        public bool NotRelevant { get; set; } = false;
    }
}

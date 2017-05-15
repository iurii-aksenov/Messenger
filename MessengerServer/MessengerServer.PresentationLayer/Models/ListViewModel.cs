using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MessengerServer.PresentationLayer.Models
{
    public class ListViewModel
    {
        public int ListId { get; set; }
        public DateTime ModificationDate { get; set; } = DateTime.Now;
        public bool NotRelevant { get; set; } = false;

        public IEnumerable<ContactViewModel> Contacts { get; set; }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MessengerServer.DataAccessLayer.Repositories;
using MessengerServer.DataAccessLayer.EntityFramework;

namespace MessengerServer.DataAccessLayer
{
    class Program
    {
        static void Main(string[] args)
        {


            //list.Title = "test1";
            //list.CreatorId = 37;
            //list.ListId = 58;
            //list.Title = "change";

            ListContactRepository lcr = new ListContactRepository(new MessengerContext());
            ListContact listContact = new ListContact();
            listContact.ListId = 58;
            listContact.ContactId = 43;
            //lcr.Create(listContact);
            //Console.WriteLine(lcr.GetListContactIdByListIdAndContactId(58,43));
            //Console.WriteLine(lcr.GetTheQuantityFriendsOfContact(38));

            ListRepository lc = new ListRepository(new MessengerContext());

            foreach (var item in lc.GetListOfFriendsIdByContactId(37))
            {
                Console.WriteLine(item);
            }
            

        }
    }
}

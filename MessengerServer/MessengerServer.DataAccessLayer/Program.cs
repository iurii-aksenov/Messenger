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

            ListRepository lr = new ListRepository(new EntityFramework.MessengerContext());
            List list = new List();
            list.Title = "test1";
            list.CreatorId = 37;
            list.ListId = 58;
            //list.Title = "change";
            //lr.Create(list);
            lr.Update(list);
            Console.WriteLine(lr.Get(58).Title);

        }
    }
}

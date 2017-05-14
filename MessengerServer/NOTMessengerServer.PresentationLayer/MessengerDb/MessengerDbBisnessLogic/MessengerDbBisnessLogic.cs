using MessengerServer.MessengerDb.MessengerContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MessengerServer.MessengerDb.MessengerContext;
using Serilog;

namespace MessengerServer.MessengerDb.MessengerDbBisnessLogic
{
    public class MessengerDbBisnessLogic : IDbBisnessLogic
    {
        //public bool InsertNewContactInMessengerDb(Contact contact)
        //{
        //    using(MessengerDbContext db = new MessengerDbContext())
        //    {
        //        try
        //        {
        //            db.Contacts.Add(contact);
        //            db.SaveChanges();
        //            List list = new List();
        //            list.CreatorId = contact.ContactId;
        //            list.Title = "FRIENDS";
        //            list.CreationDate = DateTime.Now;
        //            db.Lists.Add(list);
        //            db.SaveChanges();
        //            Console.WriteLine("Контакт добавлен");
        //        }
        //        catch(Exception e)
        //        {
        //            Console.WriteLine("Контакт не добавлен ", e.Message);
        //            return false;
        //        }
        //        return true;
        //    } 
        //}

        //public List<Contact> GetFriendListByContact(Contact contact)
        //{
        //    List<Contact> friendList =new List<Contact>();
        //    using (MessengerDbContext db = new MessengerDbContext())
        //    {
                
        //        var friendsId = db.ListContacts
        //            .Where(lc=>lc.ListId == db.Lists
        //                .Where(l=>(l.CreatorId==contact.ContactId && l.Title.ToUpper()=="Friends".ToUpper())).FirstOrDefault().ListId).Select(x=>x.ContactId).ToList();
        //        foreach (int friendId in friendsId)
        //        {
        //            friendList.Add(db.Contacts.Find(friendId));
        //        }
                
        //    }
        //    return friendList;
        //}
    }
}

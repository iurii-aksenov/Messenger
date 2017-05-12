using MessengerServer.DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MessengerServer.DataAccessLayer.EntityFramework;
using System.Data.SqlClient;

namespace MessengerServer.DataAccessLayer.Repositories
{
    public class ListContactRepository : IListContactRepository
    {
        private MessengerContext db;

        public ListContactRepository(MessengerContext context)
        {
            this.db = context;
        }

        public void Create(ListContact listContact)
        {
            db.ListContacts.Add(listContact);
            //try
            //{
            //    SqlParameter listId = new SqlParameter("@listId", listContact.ListId);
            //    SqlParameter contactId = new SqlParameter("@contactId", listContact.ContactId);
            //    SqlParameter creationDate = new SqlParameter("@creationDate", listContact.CreationDate);
            //    SqlParameter modificationDate = new SqlParameter("@modificationDate", listContact.ModificationDate);
            //    SqlParameter notRelevant = new SqlParameter("@notRelevant", listContact.NotRelevant);

            //    db.Database.SqlQuery<int>("ListContact_InsertListContact @listId, @contactId, @creationDate, @modificationDate, @notRelevant",
            //                                                             listId, contactId, creationDate, modificationDate, notRelevant).FirstOrDefault();
            //}
            //catch (SqlException e)
            //{
            //    Console.Write("SqlException " + e.Message);
            //}
            //catch (Exception e)
            //{
            //    Console.Write(" " + e.Message);
            //}

        }

        public void Delete(int id)
        {
            ListContact listContact = db.ListContacts.Find(id);
            if (listContact != null)
                db.ListContacts.Remove(listContact);
        }

        public IEnumerable<ListContact> Find(Func<ListContact, bool> predicate)
        {
            return db.ListContacts.Where(predicate).ToList();
        }

        public ListContact Get(int id)
        {
            return db.ListContacts.Find(id);
            //try
            //{
            //    SqlParameter listContactId = new SqlParameter("@listContactId", id);
            //    var listContact =  db.Database.SqlQuery<ListContact>("SELECT * FROM ListContact_GetListContactByContactListId(@listContactId)", listContactId).FirstOrDefault();
            //    return (listContact);
            //}
            //catch (SqlException e)
            //{
            //    Console.Write("SqlException " + e.Message);
            //}
            //catch (Exception e)
            //{
            //    Console.Write(" " + e.Message);
            //}

            //return null;
        }

        public IEnumerable<ListContact> GetAll()
        {
            return db.ListContacts;
        }

        public int? GetId(int listId, int contactId)
        {
            try
            {
                SqlParameter _listId = new SqlParameter("@listId", listId);
                SqlParameter _contactId = new SqlParameter("@contactId", contactId);
                var listContactId = db.Database.SqlQuery<int>("SELECT [dbo].[ListContact_GetListContactIdByListIdAndContactId](@listId, @contactId)",_listId, _contactId).FirstOrDefault();
                return (listContactId);
            }
            catch (SqlException e)
            {
                Console.Write("SqlException " + e.Message);
            }
            catch (Exception e)
            {
                Console.Write(" " + e.Message);
            }

            return null;
        }

        public int GetTheQuantityFriendsOfContact(int contactId)
        {
            throw new NotImplementedException();

            try
            {
                SqlParameter _contactId = new SqlParameter("@contactId", contactId);
                var quantityFriends = db.Database.SqlQuery<int>("SELECT [dbo].[ListContact_GetTheQuantityFriendsOfContact](@contactId)", _contactId).FirstOrDefault();
                return (quantityFriends);
            }
            catch (SqlException e)
            {
                Console.Write("SqlException " + e.Message);
            }
            catch (Exception e)
            {
                Console.Write(" " + e.Message);
            }

            return -1;
        }

        public void Update(ListContact listContact)
        {
            db.Entry(listContact).State = System.Data.Entity.EntityState.Modified;
            //try
            //{
            //    SqlParameter listContactId = new SqlParameter("@listContactId", listContact.ListContactId);
            //    SqlParameter listId = new SqlParameter("@listId", listContact.ListId);
            //    SqlParameter contactId = new SqlParameter("@contactId", listContact.ContactId);
            //    SqlParameter notRelevant = new SqlParameter("@notRelevant", listContact.NotRelevant);

            //    db.Database.SqlQuery<int>("ListContact_UpdateListContact @listContactId, @listId, @contactId, @notRelevant",
            //                                                             listContactId, listId, contactId, notRelevant).FirstOrDefault();
            //}
            //catch (SqlException e)
            //{
            //    Console.Write("SqlException " + e.Message);
            //}
            //catch (Exception e)
            //{
            //    Console.Write(" " + e.Message);
            //}
        }
    }
}

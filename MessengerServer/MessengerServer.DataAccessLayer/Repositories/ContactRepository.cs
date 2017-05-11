using MessengerServer.DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MessengerServer.DataAccessLayer.EntityFramework;

namespace MessengerServer.DataAccessLayer.Repositories
{
    public class ContactRepository : IContactRepository
    {
        private MessengerContext db;

        public ContactRepository(MessengerContext context)
        {
            this.db = context;
        }

        public void Create(Contact item)
        {
            SqlParameter firstName = new SqlParameter("@firstName", item.FirstName);
            SqlParameter secondName = new SqlParameter("@secondName", item.SecondName);
            SqlParameter middleName = new SqlParameter("@middleName", item.MiddleName);
            SqlParameter sex = new SqlParameter("@sex", item.Sex);
            SqlParameter birthDate = new SqlParameter("@birthDate", item.BirthDate);
            SqlParameter email = new SqlParameter("@email", item.Email);
            SqlParameter phone  = new SqlParameter("@phone", item.Phone);
            SqlParameter comment = new SqlParameter("@comment", item.Comment);
            SqlParameter creationDate = new SqlParameter("@creationDate", item.CreationDate);
            SqlParameter modificationDate = new SqlParameter("@modificationDate", item.ModificationDate);
            SqlParameter disable = new SqlParameter("@disable", item.Disable);
            SqlParameter notRelevant = new SqlParameter("@notRelevant", item.NotRelevant);

            try
            {

                db.Database.SqlQuery<int>("Contact_InsertContact @firstName, @secondName, @middleName, @sex, @birthDate, @email, @phone, @comment, @creationDate, @modificationDate, @disable, @notRelevant",
                                                                                  firstName, secondName, middleName, sex, birthDate, email, phone, comment, creationDate, modificationDate, disable, notRelevant).FirstOrDefault();
            }
            catch (SqlException e)
            {
                Console.Write("SQL " + e.Message);
            }
            catch (Exception e)
            {
                Console.Write(" " + e.Message);
            }
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Contact> Find(Func<Contact, bool> predicate)
        {
            throw new NotImplementedException();
        }

        public Contact Get(int id)
        {
            using (db)
            {
                SqlParameter contactId = new SqlParameter("@contactId", id);
                var contact =  db.Database.SqlQuery<Contact>("SELECT * from Contact_GetContactByContactId(@contactId)", contactId).FirstOrDefault();
                return (contact);
            }
        }

        public IEnumerable<Contact> GetAll()
        {
            throw new NotImplementedException();
        }

        public Contact GetContactByEmail(string email)
        {
            throw new NotImplementedException();
        }

        public int GetContactIdByEmail(string email)
        {
            throw new NotImplementedException();
        }

        public void Update(Contact item)
        {
            throw new NotImplementedException();
        }
    }
}

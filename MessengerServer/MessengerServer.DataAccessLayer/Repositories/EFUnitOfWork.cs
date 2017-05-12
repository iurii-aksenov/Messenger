using MessengerServer.DataAccessLayer.EntityFramework;
using MessengerServer.DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MessengerServer.DataAccessLayer.Repositories
{
    public class EFUnitOfWork : IUnitOfWork
    {
        private MessengerContext db;
        private ContactRepository contactRepository;
        private DialogRepository dialogRepository;
        private DialogMessageRepository dialogMessageRepository;
        private DialogMessageTextRepository dialogMessageTextRepository;
        private ListRepository listRepository;
        private ListContactRepository listContactRepository;
        
        
        public EFUnitOfWork(string connectionString)
        {
            db = new MessengerContext(connectionString);
        }

        public IContactRepository Contacts
        {
            get
            {
                if (contactRepository == null)
                    contactRepository = new ContactRepository(db);
                return contactRepository;
            }
        }

        public IDialogRepository Dialogs
        {
            get
            {
                if (dialogRepository == null)
                    dialogRepository = new DialogRepository(db);
                return dialogRepository;
            }
        }

        public IDialogMessageRepository DialogMessages
        {
            get
            {
                if (dialogMessageRepository == null)
                    dialogMessageRepository = new DialogMessageRepository(db);
                return dialogMessageRepository;
            }
        }

        public IDialogMessageTextRepository DialogMessageTexts
        {
            get
            {
                if (dialogMessageTextRepository == null)
                    dialogMessageTextRepository = new DialogMessageTextRepository(db);
                return dialogMessageTextRepository;
            }
        }

        public IListRepository Lists
        {
            get
            {
                if (listRepository == null)
                    listRepository = new ListRepository(db);
                return listRepository;
            }
        }

        public IListContactRepository ListContacts
        {
            get
            {
                if (listContactRepository == null)
                    listContactRepository = new ListContactRepository(db);
                return listContactRepository;
            }
        }

        public void Save()
        {
            db.SaveChanges();
        }

        private bool disposed = false;

        public virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    db.Dispose();
                }
                this.disposed = true;
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        
    }
}

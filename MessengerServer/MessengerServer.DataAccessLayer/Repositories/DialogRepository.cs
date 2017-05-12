using MessengerServer.DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MessengerServer.DataAccessLayer.EntityFramework;

namespace MessengerServer.DataAccessLayer.Repositories
{
    public class DialogRepository : IDialogRepository
    {
        private MessengerContext db;

        public DialogRepository(MessengerContext context)
        {
            this.db = context;
        }

        public void Create(Dialog dialog)
        {
            db.Dialogs.Add(dialog);
        }

        public void Delete(int id)
        {
            Dialog dialog = db.Dialogs.Find(id);
            if (dialog != null)
                db.Dialogs.Remove(dialog);
        }

        public IEnumerable<Dialog> Find(Func<Dialog, bool> predicate)
        {
            return db.Dialogs.Where(predicate).ToList();
        }

        public Dialog Get(int id)
        {
            return db.Dialogs.Find(id);
        }

        public IEnumerable<Dialog> GetAll()
        {
            return db.Dialogs;
        }

        public List<Dialog> GetDialogsOfContactId(int contactId)
        {
            throw new NotImplementedException();
        }

        public void Update(Dialog dialog)
        {
            db.Entry(dialog).State = System.Data.Entity.EntityState.Modified;
        }
    }
}

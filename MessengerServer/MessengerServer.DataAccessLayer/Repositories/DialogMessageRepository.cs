
using MessengerServer.DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MessengerServer.DataAccessLayer.EntityFramework;

namespace MessengerServer.DataAccessLayer.Repositories
{
    public class DialogMessageRepository : IDialogMessageRepository
    {
        private MessengerContext db;

        public DialogMessageRepository(MessengerContext context)
        {
            this.db = context;
        }

        public void Create(DialogMessage dialogMessage)
        {
            db.DialogMessages.Add(dialogMessage);
        }

        public void Delete(int id)
        {
            DialogMessage dialogMessage = db.DialogMessages.Find(id);
            if (dialogMessage != null)
                db.DialogMessages.Remove(dialogMessage);
        }

        public IEnumerable<DialogMessage> Find(Func<DialogMessage, bool> predicate)
        {
            return db.DialogMessages.Where(predicate).ToList();
        }

        public DialogMessage Get(int id)
        {
            return db.DialogMessages.Find(id);
        }

        public IEnumerable<DialogMessage> GetAll()
        {
            return db.DialogMessages;
        }

        public string GetTextOfDialogMessage(int DialogMessageId)
        {
            throw new NotImplementedException();
        }

        public void Update(DialogMessage dialogMessage)
        {
            db.Entry(dialogMessage).State = System.Data.Entity.EntityState.Modified;
        }
    }
}

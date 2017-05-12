using MessengerServer.DataAccessLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MessengerServer.DataAccessLayer.EntityFramework;

namespace MessengerServer.DataAccessLayer.Repositories
{
    public class DialogMessageTextRepository : IDialogMessageTextRepository
    {
        private MessengerContext db;

        public DialogMessageTextRepository(MessengerContext context)
        {
            this.db = context;
        }

        public void Create(DialogMessageText dialogMessageText)
        {
            db.DialogMessageTexts.Add(dialogMessageText);
        }

        public void Delete(int id)
        {
            DialogMessageText dialogMessageText = db.DialogMessageTexts.Find(id);
            if (dialogMessageText != null)
                db.DialogMessageTexts.Remove(dialogMessageText);
        }

        public IEnumerable<DialogMessageText> Find(Func<DialogMessageText, bool> predicate)
        {
            return db.DialogMessageTexts.Where(predicate).ToList();
        }

        public DialogMessageText Get(int id)
        {
            return db.DialogMessageTexts.Find(id);
        }

        public IEnumerable<DialogMessageText> GetAll()
        {
            return db.DialogMessageTexts;
        }

        public void Update(DialogMessageText dialogMessageText)
        {
            db.Entry(dialogMessageText).State = System.Data.Entity.EntityState.Modified;
        }
    }
}

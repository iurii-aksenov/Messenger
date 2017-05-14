namespace MessengerServer.MessengerDb.MessengerContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Dialog")]
    public partial class Dialog
    {
        public int DialogId { get; set; }

        public int OwnerId { get; set; }

        public int InterlocutorId { get; set; }

        public int LastDialogMessageId { get; set; }

        public DateTime CreationDate { get; set; }

        public DateTime ModificationDate { get; set; }

        public bool NotRelevant { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] RowVersion { get; set; }

        public virtual Contact Contact { get; set; }

        public virtual Contact Contact1 { get; set; }

        public virtual DialogMessage DialogMessage { get; set; }
    }
}

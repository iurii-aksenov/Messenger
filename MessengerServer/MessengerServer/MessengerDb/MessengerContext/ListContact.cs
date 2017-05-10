namespace MessengerServer.MessengerDb.MessengerContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ListContact")]
    public partial class ListContact
    {
        public int ListContactId { get; set; }

        public int ListId { get; set; }

        public int ContactId { get; set; }

        public DateTime CreationDate { get; set; }

        public DateTime ModificationDate { get; set; }

        public bool NotRelevant { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] RowVersion { get; set; }

        public virtual Contact Contact { get; set; }

        public virtual List List { get; set; }
    }
}

namespace MessengerServer.MessengerDb.MessengerContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ConversationMessageReadState")]
    public partial class ConversationMessageReadState
    {
        public int ConversationMessageReadStateId { get; set; }

        public int ConversationMessageId { get; set; }

        public int ContactId { get; set; }

        public DateTime CreationDate { get; set; }

        public bool NotRelevant { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] RowVersion { get; set; }

        public virtual Contact Contact { get; set; }

        public virtual ConversationMessage ConversationMessage { get; set; }
    }
}

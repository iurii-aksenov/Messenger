namespace MessengerServer.DataAccessLayer.EntityFramework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ConversationParticipant")]
    public partial class ConversationParticipant
    {
        public int ConversationParticipantId { get; set; }

        public int ConversationId { get; set; }

        public int ParticipantId { get; set; }

        public DateTime CreationDate { get; set; }

        public bool NotRelevant { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] RowVersion { get; set; }

        public virtual Contact Contact { get; set; }

        public virtual Conversation Conversation { get; set; }
    }
}

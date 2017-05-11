namespace MessengerServer.DataAccessLayer.EntityFramework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Conversation")]
    public partial class Conversation
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Conversation()
        {
            ConversationParticipants = new HashSet<ConversationParticipant>();
        }

        public int ConversationId { get; set; }

        [Required]
        [StringLength(40)]
        public string Title { get; set; }

        public int CreatorId { get; set; }

        public int LastConversationMessageId { get; set; }

        public DateTime CreationDate { get; set; }

        public DateTime ModificationDate { get; set; }

        public bool NotRelevant { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] RowVersion { get; set; }

        public virtual Contact Contact { get; set; }

        public virtual ConversationMessage ConversationMessage { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ConversationParticipant> ConversationParticipants { get; set; }
    }
}

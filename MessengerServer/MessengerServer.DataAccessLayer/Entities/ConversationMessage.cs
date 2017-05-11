namespace MessengerServer.DataAccessLayer.EntityFramework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ConversationMessage")]
    public partial class ConversationMessage
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ConversationMessage()
        {
            Conversations = new HashSet<Conversation>();
            ConversationMessage1 = new HashSet<ConversationMessage>();
            ConversationMessageReadStates = new HashSet<ConversationMessageReadState>();
        }

        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ConversationMessageId { get; set; }

        public int AuthorId { get; set; }

        public int ConversationMessageTextId { get; set; }

        public int PreviousConversationMessageId { get; set; }

        public DateTime CreationDate { get; set; }

        public DateTime ModificationDate { get; set; }

        public bool NotRelevant { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] RowVersion { get; set; }

        public virtual Contact Contact { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Conversation> Conversations { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ConversationMessage> ConversationMessage1 { get; set; }

        public virtual ConversationMessage ConversationMessage2 { get; set; }

        public virtual ConversationMessageText ConversationMessageText { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ConversationMessageReadState> ConversationMessageReadStates { get; set; }
    }
}

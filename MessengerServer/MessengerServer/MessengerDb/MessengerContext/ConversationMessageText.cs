namespace MessengerServer.MessengerDb.MessengerContext
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ConversationMessageText")]
    public partial class ConversationMessageText
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ConversationMessageText()
        {
            ConversationMessages = new HashSet<ConversationMessage>();
        }

        public int ConversationMessageTextId { get; set; }

        [StringLength(2500)]
        public string Text { get; set; }

        public DateTime CreationDate { get; set; }

        public bool NotRelevant { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] RowVersion { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ConversationMessage> ConversationMessages { get; set; }
    }
}

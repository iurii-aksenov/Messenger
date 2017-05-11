namespace MessengerServer.DataAccessLayer.EntityFramework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DialogMessage")]
    public partial class DialogMessage
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DialogMessage()
        {
            Dialogs = new HashSet<Dialog>();
            DialogMessage1 = new HashSet<DialogMessage>();
        }

        public int DialogMessageId { get; set; }

        public int AuthorId { get; set; }

        public int DialogMessageTextId { get; set; }

        [Required]
        [StringLength(6)]
        public string ReadStatus { get; set; }

        public int? PreviousDialogMessageId { get; set; }

        public DateTime CreationDate { get; set; }

        public DateTime ModificationDate { get; set; }

        public bool NotRelevant { get; set; }

        [Column(TypeName = "timestamp")]
        [MaxLength(8)]
        [Timestamp]
        public byte[] RowVersion { get; set; }

        public virtual Contact Contact { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Dialog> Dialogs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DialogMessage> DialogMessage1 { get; set; }

        public virtual DialogMessage DialogMessage2 { get; set; }

        public virtual DialogMessageText DialogMessageText { get; set; }
    }
}

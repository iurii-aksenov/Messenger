namespace MessengerServer.MessengerDb.MessengerContext
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using System.Data.Entity.ModelConfiguration;

    public partial class MessengerDbContext : DbContext
    {
        public MessengerDbContext()
            : base("name=MessengerContext")
        {
        }

        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<Conversation> Conversations { get; set; }
        public virtual DbSet<ConversationMessage> ConversationMessages { get; set; }
        public virtual DbSet<ConversationMessageReadState> ConversationMessageReadStates { get; set; }
        public virtual DbSet<ConversationMessageText> ConversationMessageTexts { get; set; }
        public virtual DbSet<ConversationParticipant> ConversationParticipants { get; set; }
        public virtual DbSet<Dialog> Dialogs { get; set; }
        public virtual DbSet<DialogMessage> DialogMessages { get; set; }
        public virtual DbSet<DialogMessageText> DialogMessageTexts { get; set; }
        public virtual DbSet<List> Lists { get; set; }
        public virtual DbSet<ListContact> ListContacts { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new ContactConfiguration());

            modelBuilder.Configurations.Add(new ConversationConfiguration());
            modelBuilder.Configurations.Add(new ConversationMessageConfiguration());
            modelBuilder.Configurations.Add(new ConversationMessageReadStateConfiguration());
            modelBuilder.Configurations.Add(new ConversationMessageTextConfiguration());
            modelBuilder.Configurations.Add(new ConversationParticipantConfiguration());

            modelBuilder.Configurations.Add(new DialogConfiguration());
            modelBuilder.Configurations.Add(new DialogMessageConfiguration());
            modelBuilder.Configurations.Add(new DialogMessageTextConfiguration());

            modelBuilder.Configurations.Add(new ListConfiguration());
            modelBuilder.Configurations.Add(new ListContactConfiguration());
        }
    }

    public class ContactConfiguration : EntityTypeConfiguration<Contact>
    {
        public ContactConfiguration()
        {
            ToTable("Contact")
               .Property(e => e.Sex)
               .IsUnicode(false);

            ToTable("Contact")
                .Property(e => e.Email)
                .IsUnicode(false);

            ToTable("Contact")
                .Property(e => e.Phone)
                .IsUnicode(false);

            ToTable("Contact")
                .Property(e => e.RowVersion)
                .IsFixedLength();

            ToTable("Contact")
                .HasMany(e => e.Conversations)
                .WithRequired(e => e.Contact)
                .HasForeignKey(e => e.CreatorId)
                .WillCascadeOnDelete(false);

            ToTable("Contact")
                .HasMany(e => e.ConversationMessages)
                .WithRequired(e => e.Contact)
                .HasForeignKey(e => e.AuthorId)
                .WillCascadeOnDelete(false);

            ToTable("Contact")
                .HasMany(e => e.ConversationMessageReadStates)
                .WithRequired(e => e.Contact)
                .WillCascadeOnDelete(false);

            ToTable("Contact")
                .HasMany(e => e.ConversationParticipants)
                .WithRequired(e => e.Contact)
                .HasForeignKey(e => e.ParticipantId)
                .WillCascadeOnDelete(false);

            ToTable("Contact")
                .HasMany(e => e.Dialogs)
                .WithRequired(e => e.Contact)
                .HasForeignKey(e => e.InterlocutorId)
                .WillCascadeOnDelete(false);

            ToTable("Contact")
                .HasMany(e => e.Dialogs1)
                .WithRequired(e => e.Contact1)
                .HasForeignKey(e => e.OwnerId)
                .WillCascadeOnDelete(false);

            ToTable("Contact")
                .HasMany(e => e.DialogMessages)
                .WithRequired(e => e.Contact)
                .HasForeignKey(e => e.AuthorId)
                .WillCascadeOnDelete(false);

            ToTable("Contact")
                .HasMany(e => e.Lists)
                .WithRequired(e => e.Contact)
                .HasForeignKey(e => e.CreatorId)
                .WillCascadeOnDelete(false);

            ToTable("Contact")
                .HasMany(e => e.ListContacts)
                .WithRequired(e => e.Contact)
                .WillCascadeOnDelete(false);
        }
    }

    public class ConversationConfiguration : EntityTypeConfiguration<Conversation>
    {
        public ConversationConfiguration()
        {
            ToTable("Conversation")
                .Property(e => e.RowVersion)
                .IsFixedLength();

            ToTable("Conversation")
                 .HasMany(e => e.ConversationParticipants)
                .WithRequired(e => e.Conversation)
                .WillCascadeOnDelete(false);
        }
    }
    public class ConversationMessageConfiguration : EntityTypeConfiguration<ConversationMessage>
    {
        public ConversationMessageConfiguration()
        {
            ToTable("ConversationMessage")
               .Property(e => e.RowVersion)
               .IsFixedLength();

            ToTable("ConversationMessage")
                .HasMany(e => e.Conversations)
                .WithRequired(e => e.ConversationMessage)
                .HasForeignKey(e => e.LastConversationMessageId)
                .WillCascadeOnDelete(false);

            ToTable("ConversationMessage")
                .HasMany(e => e.ConversationMessage1)
                .WithRequired(e => e.ConversationMessage2)
                .HasForeignKey(e => e.PreviousConversationMessageId);

            ToTable("ConversationMessage")
                .HasMany(e => e.ConversationMessageReadStates)
                .WithRequired(e => e.ConversationMessage)
                .WillCascadeOnDelete(false);
        }
    }
    public class ConversationMessageReadStateConfiguration : EntityTypeConfiguration<ConversationMessageReadState>
    {
        public ConversationMessageReadStateConfiguration()
        {
            ToTable("ConversationMessageReadState")
               .Property(e => e.RowVersion)
               .IsFixedLength();
        }
    }
    public class ConversationMessageTextConfiguration : EntityTypeConfiguration<ConversationMessageText>
    {
        public ConversationMessageTextConfiguration()
        {
            ToTable("ConversationMessageText")
               .Property(e => e.RowVersion)
               .IsFixedLength();

            ToTable("ConversationMessageText")
                .HasMany(e => e.ConversationMessages)
                .WithRequired(e => e.ConversationMessageText)
                .WillCascadeOnDelete(false);
        }
    }
    public class ConversationParticipantConfiguration : EntityTypeConfiguration<ConversationParticipant>
    {
        public ConversationParticipantConfiguration()
        {
            ToTable("ConversationParticipant")
                .Property(e => e.RowVersion)
                .IsFixedLength();
        }
    }

    public class DialogConfiguration : EntityTypeConfiguration<Dialog>
    {
        public DialogConfiguration()
        {
           ToTable("Dialog")
               .Property(e => e.RowVersion)
               .IsFixedLength();
        }
    }
    public class DialogMessageConfiguration : EntityTypeConfiguration<DialogMessage>
    {
        public DialogMessageConfiguration()
        {
            ToTable("DialogMessage")
                .Property(e => e.ReadStatus)
               .IsUnicode(false);

            ToTable("DialogMessage")
                .Property(e => e.RowVersion)
                .IsFixedLength();

            ToTable("DialogMessage")
                 .HasMany(e => e.Dialogs)
                .WithRequired(e => e.DialogMessage)
                .HasForeignKey(e => e.LastDialogMessageId)
                .WillCascadeOnDelete(false);

            ToTable("DialogMessage")
                .HasMany(e => e.DialogMessage1)
                .WithOptional(e => e.DialogMessage2)
                .HasForeignKey(e => e.PreviousDialogMessageId);
        }
    }
    public class DialogMessageTextConfiguration : EntityTypeConfiguration<DialogMessageText>
    {
        public DialogMessageTextConfiguration()
        {
            ToTable("DialogMessageText")
                .Property(e => e.RowVersion)
               .IsFixedLength();

            ToTable("DialogMessageText")
                 .HasMany(e => e.DialogMessages)
                .WithRequired(e => e.DialogMessageText)
                .WillCascadeOnDelete(false);
        }
    }

    public class ListConfiguration : EntityTypeConfiguration<List>
    {
        public ListConfiguration()
        {
            ToTable("List")
               .Property(e => e.RowVersion)
               .IsFixedLength();

            ToTable("List")
                 .HasMany(e => e.ListContacts)
                .WithRequired(e => e.List)
                .WillCascadeOnDelete(false);
        }
    }
    public class ListContactConfiguration : EntityTypeConfiguration<ListContact>
    {
        public ListContactConfiguration()
        {
            ToTable("ListContact")
                .Property(e => e.RowVersion)
                .IsFixedLength();
        }
    }

}

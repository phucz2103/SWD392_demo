using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace demo.Models
{
    public partial class EdunextSystemDBContext : DbContext
    {
        public EdunextSystemDBContext()
        {
        }

        public EdunextSystemDBContext(DbContextOptions<EdunextSystemDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Account> Accounts { get; set; } = null!;
        public virtual DbSet<Answer> Answers { get; set; } = null!;
        public virtual DbSet<Classroom> Classrooms { get; set; } = null!;
        public virtual DbSet<Course> Courses { get; set; } = null!;
        public virtual DbSet<Material> Materials { get; set; } = null!;
        public virtual DbSet<Question> Questions { get; set; } = null!;
        public virtual DbSet<Report> Reports { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Slot> Slots { get; set; } = null!;
        public virtual DbSet<StudentGroup> StudentGroups { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("server =(local); database =EdunextSystemDB;uid=sa;pwd=123;TrustServerCertificate=true");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>(entity =>
            {
                entity.HasKey(e => e.Username)
                    .HasName("PK__Accounts__F3DBC573DE6020C7");

                entity.Property(e => e.Username)
                    .HasMaxLength(50)
                    .HasColumnName("username");

                entity.Property(e => e.Password)
                    .HasMaxLength(50)
                    .HasColumnName("password");

                entity.Property(e => e.UserId).HasColumnName("userID");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Accounts)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK__Accounts__userID__3D5E1FD2");
            });

            modelBuilder.Entity<Answer>(entity =>
            {
                entity.Property(e => e.AnswerId)
                    .ValueGeneratedNever()
                    .HasColumnName("answerID");

                entity.Property(e => e.AnswerContent).HasColumnName("answerContent");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("date")
                    .HasColumnName("createdDate");

                entity.Property(e => e.IsDeleted).HasColumnName("isDeleted");

                entity.Property(e => e.QuestionId).HasColumnName("questionID");

                entity.HasOne(d => d.Question)
                    .WithMany(p => p.Answers)
                    .HasForeignKey(d => d.QuestionId)
                    .HasConstraintName("FK__Answers__questio__49C3F6B7");
            });

            modelBuilder.Entity<Classroom>(entity =>
            {
                entity.HasKey(e => e.ClassId)
                    .HasName("PK__Classroo__7577345EBE622223");

                entity.Property(e => e.ClassId)
                    .ValueGeneratedNever()
                    .HasColumnName("classID");

                entity.Property(e => e.ClassName)
                    .HasMaxLength(100)
                    .HasColumnName("className");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("date")
                    .HasColumnName("createdDate");

                entity.Property(e => e.IsDeleted).HasColumnName("isDeleted");

                entity.Property(e => e.Semester)
                    .HasMaxLength(50)
                    .HasColumnName("semester");

                entity.Property(e => e.UpdatedDate)
                    .HasColumnType("date")
                    .HasColumnName("updatedDate");

                entity.HasMany(d => d.Users)
                    .WithMany(p => p.Classes)
                    .UsingEntity<Dictionary<string, object>>(
                        "Enrollment",
                        l => l.HasOne<User>().WithMany().HasForeignKey("UserId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__Enrollmen__userI__571DF1D5"),
                        r => r.HasOne<Classroom>().WithMany().HasForeignKey("ClassId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__Enrollmen__class__5629CD9C"),
                        j =>
                        {
                            j.HasKey("ClassId", "UserId").HasName("PK__Enrollme__99CE95938F2C7D00");

                            j.ToTable("Enrollment");

                            j.IndexerProperty<int>("ClassId").HasColumnName("classID");

                            j.IndexerProperty<int>("UserId").HasColumnName("userID");
                        });

                entity.HasMany(d => d.Users1)
                    .WithMany(p => p.Classes1)
                    .UsingEntity<Dictionary<string, object>>(
                        "Teaching",
                        l => l.HasOne<User>().WithMany().HasForeignKey("UserId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__Teaching__userID__5AEE82B9"),
                        r => r.HasOne<Classroom>().WithMany().HasForeignKey("ClassId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__Teaching__classI__59FA5E80"),
                        j =>
                        {
                            j.HasKey("ClassId", "UserId").HasName("PK__Teaching__99CE95932559A224");

                            j.ToTable("Teaching");

                            j.IndexerProperty<int>("ClassId").HasColumnName("classID");

                            j.IndexerProperty<int>("UserId").HasColumnName("userID");
                        });

                entity.HasMany(d => d.UsersNavigation)
                    .WithMany(p => p.ClassesNavigation)
                    .UsingEntity<Dictionary<string, object>>(
                        "Managing",
                        l => l.HasOne<User>().WithMany().HasForeignKey("UserId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__Managing__userID__5EBF139D"),
                        r => r.HasOne<Classroom>().WithMany().HasForeignKey("ClassId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__Managing__classI__5DCAEF64"),
                        j =>
                        {
                            j.HasKey("ClassId", "UserId").HasName("PK__Managing__99CE9593F28C3FE8");

                            j.ToTable("Managing");

                            j.IndexerProperty<int>("ClassId").HasColumnName("classID");

                            j.IndexerProperty<int>("UserId").HasColumnName("userID");
                        });
            });

            modelBuilder.Entity<Course>(entity =>
            {
                entity.Property(e => e.CourseId)
                    .ValueGeneratedNever()
                    .HasColumnName("courseID");

                entity.Property(e => e.CourseName)
                    .HasMaxLength(100)
                    .HasColumnName("courseName");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("date")
                    .HasColumnName("createdDate");

                entity.Property(e => e.IsDeleted).HasColumnName("isDeleted");

                entity.Property(e => e.UpdatedDate)
                    .HasColumnType("date")
                    .HasColumnName("updatedDate");

                entity.HasMany(d => d.Classes)
                    .WithMany(p => p.Courses)
                    .UsingEntity<Dictionary<string, object>>(
                        "CourseInClass",
                        l => l.HasOne<Classroom>().WithMany().HasForeignKey("ClassId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__CourseInC__class__628FA481"),
                        r => r.HasOne<Course>().WithMany().HasForeignKey("CourseId").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("FK__CourseInC__cours__619B8048"),
                        j =>
                        {
                            j.HasKey("CourseId", "ClassId").HasName("PK__CourseIn__DDFF3CB4A3BBEBA0");

                            j.ToTable("CourseInClass");

                            j.IndexerProperty<int>("CourseId").HasColumnName("courseID");

                            j.IndexerProperty<int>("ClassId").HasColumnName("classID");
                        });
            });

            modelBuilder.Entity<Material>(entity =>
            {
                entity.Property(e => e.MaterialId)
                    .ValueGeneratedNever()
                    .HasColumnName("materialID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("date")
                    .HasColumnName("createdDate");

                entity.Property(e => e.IsDeleted).HasColumnName("isDeleted");

                entity.Property(e => e.MaterialName)
                    .HasMaxLength(100)
                    .HasColumnName("materialName");

                entity.Property(e => e.SlotId).HasColumnName("slotID");

                entity.HasOne(d => d.Slot)
                    .WithMany(p => p.Materials)
                    .HasForeignKey(d => d.SlotId)
                    .HasConstraintName("FK__Materials__slotI__4F7CD00D");
            });

            modelBuilder.Entity<Question>(entity =>
            {
                entity.Property(e => e.QuestionId)
                    .ValueGeneratedNever()
                    .HasColumnName("questionID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("date")
                    .HasColumnName("createdDate");

                entity.Property(e => e.IsDeleted).HasColumnName("isDeleted");

                entity.Property(e => e.QuestionContent).HasColumnName("questionContent");

                entity.Property(e => e.QuestionTitle)
                    .HasMaxLength(100)
                    .HasColumnName("questionTitle");

                entity.Property(e => e.SlotId).HasColumnName("slotID");

                entity.HasOne(d => d.Slot)
                    .WithMany(p => p.Questions)
                    .HasForeignKey(d => d.SlotId)
                    .HasConstraintName("FK__Questions__slotI__46E78A0C");
            });

            modelBuilder.Entity<Report>(entity =>
            {
                entity.Property(e => e.ReportId)
                    .ValueGeneratedNever()
                    .HasColumnName("reportID");

                entity.Property(e => e.CreatedBy).HasColumnName("createdBy");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("date")
                    .HasColumnName("createdDate");

                entity.Property(e => e.IsRead).HasColumnName("isRead");

                entity.Property(e => e.IsSolved).HasColumnName("isSolved");

                entity.Property(e => e.ReportDetail).HasColumnName("reportDetail");

                entity.Property(e => e.ReportTitle)
                    .HasMaxLength(100)
                    .HasColumnName("reportTitle");

                entity.Property(e => e.SolvedBy).HasColumnName("solvedBy");

                entity.Property(e => e.SolvedDate)
                    .HasColumnType("date")
                    .HasColumnName("solvedDate");

                entity.HasOne(d => d.CreatedByNavigation)
                    .WithMany(p => p.ReportCreatedByNavigations)
                    .HasForeignKey(d => d.CreatedBy)
                    .HasConstraintName("FK__Reports__created__52593CB8");

                entity.HasOne(d => d.SolvedByNavigation)
                    .WithMany(p => p.ReportSolvedByNavigations)
                    .HasForeignKey(d => d.SolvedBy)
                    .HasConstraintName("FK__Reports__solvedB__534D60F1");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.RoleId)
                    .ValueGeneratedNever()
                    .HasColumnName("roleID");

                entity.Property(e => e.RoleName)
                    .HasMaxLength(50)
                    .HasColumnName("roleName");
            });

            modelBuilder.Entity<Slot>(entity =>
            {
                entity.Property(e => e.SlotId)
                    .ValueGeneratedNever()
                    .HasColumnName("slotID");

                entity.Property(e => e.CourseId).HasColumnName("courseID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("date")
                    .HasColumnName("createdDate");

                entity.Property(e => e.IsDeleted).HasColumnName("isDeleted");

                entity.Property(e => e.Message).HasColumnName("message");

                entity.Property(e => e.SlotName)
                    .HasMaxLength(100)
                    .HasColumnName("slotName");

                entity.Property(e => e.UpdatedDate)
                    .HasColumnType("date")
                    .HasColumnName("updatedDate");

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.Slots)
                    .HasForeignKey(d => d.CourseId)
                    .HasConstraintName("FK__Slots__courseID__440B1D61");
            });

            modelBuilder.Entity<StudentGroup>(entity =>
            {
                entity.Property(e => e.StudentGroupId)
                    .ValueGeneratedNever()
                    .HasColumnName("studentGroupID");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("date")
                    .HasColumnName("createdDate");

                entity.Property(e => e.NumberOfStudents).HasColumnName("numberOfStudents");

                entity.Property(e => e.SlotId).HasColumnName("slotID");

                entity.Property(e => e.StudentGroupName)
                    .HasMaxLength(100)
                    .HasColumnName("studentGroupName");

                entity.HasOne(d => d.Slot)
                    .WithMany(p => p.StudentGroups)
                    .HasForeignKey(d => d.SlotId)
                    .HasConstraintName("FK__StudentGr__slotI__4CA06362");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasIndex(e => e.Email, "UQ__Users__AB6E6164065F9876")
                    .IsUnique();

                entity.Property(e => e.UserId)
                    .ValueGeneratedNever()
                    .HasColumnName("userID");

                entity.Property(e => e.Birthdate)
                    .HasColumnType("date")
                    .HasColumnName("birthdate");

                entity.Property(e => e.Email)
                    .HasMaxLength(100)
                    .HasColumnName("email");

                entity.Property(e => e.JoinedDate)
                    .HasColumnType("date")
                    .HasColumnName("joinedDate");

                entity.Property(e => e.Name)
                    .HasMaxLength(100)
                    .HasColumnName("name");

                entity.Property(e => e.RoleId).HasColumnName("roleID");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK__Users__roleID__3A81B327");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}

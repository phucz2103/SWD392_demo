using System;
using System.Collections.Generic;

namespace demoSWD.Models
{
    public partial class User
    {
        public User()
        {
            Accounts = new HashSet<Account>();
            Answers = new HashSet<Answer>();
            ReportCreatedByNavigations = new HashSet<Report>();
            ReportSolvedByNavigations = new HashSet<Report>();
            Classes = new HashSet<Classroom>();
            Classes1 = new HashSet<Classroom>();
            ClassesNavigation = new HashSet<Classroom>();
        }

        public int UserId { get; set; }
        public string Name { get; set; } = null!;
        public string Email { get; set; } = null!;
        public DateTime? Birthdate { get; set; }
        public DateTime JoinedDate { get; set; }
        public int? RoleId { get; set; }

        public virtual Role? Role { get; set; }
        public virtual ICollection<Account> Accounts { get; set; }
        public virtual ICollection<Answer> Answers { get; set; }
        public virtual ICollection<Report> ReportCreatedByNavigations { get; set; }
        public virtual ICollection<Report> ReportSolvedByNavigations { get; set; }

        public virtual ICollection<Classroom> Classes { get; set; }
        public virtual ICollection<Classroom> Classes1 { get; set; }
        public virtual ICollection<Classroom> ClassesNavigation { get; set; }
    }
}

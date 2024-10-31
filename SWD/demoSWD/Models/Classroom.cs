using System;
using System.Collections.Generic;

namespace demoSWD.Models
{
    public partial class Classroom
    {
        public Classroom()
        {
            Courses = new HashSet<Course>();
            Users = new HashSet<User>();
            Users1 = new HashSet<User>();
            UsersNavigation = new HashSet<User>();
        }

        public int ClassId { get; set; }
        public string ClassName { get; set; } = null!;
        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public bool IsDeleted { get; set; }
        public string Semester { get; set; } = null!;

        public virtual ICollection<Course> Courses { get; set; }
        public virtual ICollection<User> Users { get; set; }
        public virtual ICollection<User> Users1 { get; set; }
        public virtual ICollection<User> UsersNavigation { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace demo.Models
{
    public partial class Course
    {
        public Course()
        {
            Slots = new HashSet<Slot>();
            Classes = new HashSet<Classroom>();
        }

        public int CourseId { get; set; }
        public string CourseName { get; set; } = null!;
        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public bool IsDeleted { get; set; }

        public virtual ICollection<Slot> Slots { get; set; }

        public virtual ICollection<Classroom> Classes { get; set; }
    }
}

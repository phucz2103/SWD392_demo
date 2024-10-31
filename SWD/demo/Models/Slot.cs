using System;
using System.Collections.Generic;

namespace demo.Models
{
    public partial class Slot
    {
        public Slot()
        {
            Materials = new HashSet<Material>();
            Questions = new HashSet<Question>();
            StudentGroups = new HashSet<StudentGroup>();
        }

        public int SlotId { get; set; }
        public int? CourseId { get; set; }
        public string SlotName { get; set; } = null!;
        public DateTime? CreatedDate { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public string? Message { get; set; }
        public bool IsDeleted { get; set; }

        public virtual Course? Course { get; set; }
        public virtual ICollection<Material> Materials { get; set; }
        public virtual ICollection<Question> Questions { get; set; }
        public virtual ICollection<StudentGroup> StudentGroups { get; set; }
    }
}

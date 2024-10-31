using System;
using System.Collections.Generic;

namespace demoSWD.Models
{
    public partial class StudentGroup
    {
        public int StudentGroupId { get; set; }
        public int? SlotId { get; set; }
        public string StudentGroupName { get; set; } = null!;
        public int NumberOfStudents { get; set; }
        public DateTime? CreatedDate { get; set; }

        public virtual Slot? Slot { get; set; }
    }
}

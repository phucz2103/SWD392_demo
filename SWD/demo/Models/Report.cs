using System;
using System.Collections.Generic;

namespace demo.Models
{
    public partial class Report
    {
        public int ReportId { get; set; }
        public string ReportTitle { get; set; } = null!;
        public string ReportDetail { get; set; } = null!;
        public DateTime? CreatedDate { get; set; }
        public bool IsSolved { get; set; }
        public bool IsRead { get; set; }
        public int? SolvedBy { get; set; }
        public DateTime? SolvedDate { get; set; }
        public int? CreatedBy { get; set; }

        public virtual User? CreatedByNavigation { get; set; }
        public virtual User? SolvedByNavigation { get; set; }
    }
}

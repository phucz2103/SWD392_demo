using System;
using System.Collections.Generic;

namespace demoSWD.Models
{
    public partial class Answer
    {
        public int AnswerId { get; set; }
        public int? QuestionId { get; set; }
        public string AnswerContent { get; set; } = null!;
        public DateTime? CreatedDate { get; set; }
        public bool IsDeleted { get; set; }
        public int? CreatedBy { get; set; }

        public virtual User? CreatedByNavigation { get; set; }
        public virtual Question? Question { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace demo.Models
{
    public partial class Answer
    {
        public int AnswerId { get; set; }
        public int? QuestionId { get; set; }
        public string AnswerContent { get; set; } = null!;
        public DateTime? CreatedDate { get; set; }
        public bool IsDeleted { get; set; }

        public virtual Question? Question { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace demoSWD.Models
{
    public partial class Question
    {
        public Question()
        {
            Answers = new HashSet<Answer>();
        }

        public int QuestionId { get; set; }
        public int? SlotId { get; set; }
        public string QuestionTitle { get; set; } = null!;
        public string QuestionContent { get; set; } = null!;
        public DateTime? CreatedDate { get; set; }
        public bool IsDeleted { get; set; }

        public virtual Slot? Slot { get; set; }
        public virtual ICollection<Answer> Answers { get; set; }
    }
}

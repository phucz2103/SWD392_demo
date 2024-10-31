using System;
using System.Collections.Generic;

namespace demoSWD.Models
{
    public partial class Material
    {
        public int MaterialId { get; set; }
        public int? SlotId { get; set; }
        public string MaterialName { get; set; } = null!;
        public DateTime? CreatedDate { get; set; }
        public bool IsDeleted { get; set; }

        public virtual Slot? Slot { get; set; }
    }
}

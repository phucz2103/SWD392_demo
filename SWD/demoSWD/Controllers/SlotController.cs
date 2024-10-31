using demoSWD.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace demoSWD.Controllers
{
    public class SlotController : Controller
    {
        private readonly EdunextSystemDBContext _context;
        public IActionResult ListSlot()
        {
            using (EdunextSystemDBContext edunext = new EdunextSystemDBContext())
            {
                List<Slot> slots = edunext.Slots.Include(s => s.Questions).ToList();
                ViewBag.Slots = slots;
                return View();
            }
        }
    }
}

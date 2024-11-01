using Microsoft.AspNetCore.Mvc;
using demoSWD.Services;
using demoSWD.Models;
namespace demoSWD.Controllers
{
    public class ReportController : Controller
    {
        public ReportService _reportService = new ReportService();
        
        public IActionResult ListReport()
        {
            List<Report> reports = _reportService.GetAllReport();
            ViewBag.Reports = reports;
            return View();
        }

        public IActionResult ViewDetailReport(int reportId)
        {
            Report report = _reportService.viewDetailReport(reportId);
            if (report == null)
            {
                return NotFound();
            }
            ViewBag.Status = report.IsSolved;
            ViewBag.Report = report;
            return View(report);
        }

        [HttpPost]
        public IActionResult isReportSolved(int reportId)
        {
            bool result = _reportService.isReportSolved(reportId);

            if (!result)
            {
                TempData["ErrorMessage"] = "Failed to mark report as solved or report was not found.";
            }

            return RedirectToAction("ViewDetailReport", new { reportId = reportId });
        }

        [HttpPost]
        public IActionResult isReportRead(int reportId)
        {
            bool result = _reportService.isReportRead(reportId);

            if (!result)
            {
                TempData["ErrorMessage"] = "Failed to mark report as read or report was not found.";
            }

            return RedirectToAction("ViewDetailReport", new { reportId = reportId });
        }
    }
}

using demoSWD.Models;
using System.Collections.Generic;
using System.Linq;


namespace demoSWD.Services
{
    public class ReportService : IReportService
    {
        public List<Report> GetAllReport()
        {
            using(var edunex = new EdunextSystemDBContext())
            {
                List<Report> reports = edunex.Reports.ToList();
                return reports;
            }
        }


        public bool isReportSolved(int reportId)
        {
            using (var edunex = new EdunextSystemDBContext())
            {
                Report report = edunex.Reports.SingleOrDefault(r => r.ReportId == reportId);
                if(report == null)
                {
                    return false;
                }
                report.IsSolved = true;
                edunex.SaveChanges();
                return true;
            }
        }

        public bool isReportRead(int reportId)
        {
            using (var edunex = new EdunextSystemDBContext())
            {
                Report report = edunex.Reports.SingleOrDefault(r => r.ReportId == reportId);
                if (report == null)
                {
                    return false;
                }
                report.IsRead = true;
                edunex.SaveChanges();
                return true;
            }
        }

        public Report viewDetailReport(int reportId)
        {
            using (var edunex = new EdunextSystemDBContext())
            {
                Report report = edunex.Reports.SingleOrDefault(r => r.ReportId == reportId);
                return report;
            }
        }

    }
}

using demoSWD.Models;
namespace demoSWD.Services
{
    public interface IReportService
    {
        List<Report> GetAllReport();
        Report viewDetailReport(int reportId);
        bool isReportSolved(int reportId);
        bool isReportRead(int reportId);
    }
}

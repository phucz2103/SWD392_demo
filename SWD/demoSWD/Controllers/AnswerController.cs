using demoSWD.Models;
using demoSWD.Services;
using Microsoft.AspNetCore.Mvc;
using System.Runtime.Serialization.Formatters;

namespace demoSWD.Controllers
{
    public class AnswerController : Controller
    {
        public AnswerService answerService = new AnswerService();
        public IActionResult ViewQuestion(int questionId)
        {
            using (var edunext = new EdunextSystemDBContext())
            {
                List<Answer> answers = edunext.Answers.Where(e => e.QuestionId == questionId).ToList();
                Question question = edunext.Questions.FirstOrDefault(question => question.QuestionId == questionId);
                ViewBag.Answers = answers;
                ViewBag.Question = question;
                return View();
            }
        }

        [HttpPost]
        public ActionResult CreateQuestion(int questionId, string? content)
        {
            using (var edunext = new EdunextSystemDBContext())
            {
                if (content == null)
                {
                    content = string.Empty;
                }
                TempData["Message"] = answerService.CreateAnswerQuestion(questionId,3,content);               
                return RedirectToAction("ViewQuestion", "Answer", new { questionId = questionId }); 
            }
        }
    }
}

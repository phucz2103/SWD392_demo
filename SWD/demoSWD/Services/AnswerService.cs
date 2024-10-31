using demoSWD.Models;
using demoSWD.Services;

namespace demoSWD.Services
{
    public class AnswerService : IAnswerService
    {
        public ValidateServie validate = new ValidateServie();
        public string CreateAnswerQuestion(int questionId, int userID, string answer)
        {
            string message = "Answer can't null or exceed 300 chars";
            using(var edunex = new EdunextSystemDBContext())
            {
                if (validate.ValidateAnswer(answer))
                {
                    edunex.Answers.Add( new Answer
                    {
                        QuestionId = questionId,
                        AnswerContent = answer,
                        CreatedDate = DateTime.Now,
                        IsDeleted = false,
                        CreatedBy = userID,
                    });
                    edunex.SaveChanges();
                    message = "Answer success!";
                    return message;
                }
                return message;
            }
        }
    }
}

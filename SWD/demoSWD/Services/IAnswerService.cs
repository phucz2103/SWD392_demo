namespace demoSWD.Services
{
    public interface IAnswerService
    {
        string CreateAnswerQuestion(int questionId, int userID, string answer);
    }
}

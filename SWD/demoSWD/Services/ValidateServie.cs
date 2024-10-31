namespace demoSWD.Services
{
    public class ValidateServie : IValidateService
    {
        public bool ValidateAnswer(string answer)
        {
            if (string.IsNullOrEmpty(answer) || answer.Length >300)  
            {
                return false;
            }
            return true;
        }
    }
}

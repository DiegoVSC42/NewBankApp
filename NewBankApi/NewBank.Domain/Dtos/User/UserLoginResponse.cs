namespace NewBank.Domain.Dtos.User
{
   public class UserResponse
   {
      public int Id { get; set; }
      public string FirstName { get; set; }
      public string LastName { get; set; }
      public string Cpf { get; set; }
      public double Balance { get; set; }
      public string UserToken { get; set; }
   }
}

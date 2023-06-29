using System.Runtime.CompilerServices;

namespace NewBank.Domain.Dtos.User
{
   public class UserLoginRequest
   {
      public string Cpf { get; set; }
      public string Password { get; set; }

      public void Validate()
      {
         if (String.IsNullOrEmpty(Cpf))
            throw new Exception("usuário vazio");

         if (String.IsNullOrEmpty(Password))
            throw new Exception("senha vazia");
      }
   }
}

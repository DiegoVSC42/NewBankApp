using NewBank.Domain.Dtos.User;
using NewBank.Domain.Models;

namespace NewBank.Domain.Repositories
{
   public interface IUserRepository
   {
      public Task<User> GetUser(string username);
      public Task<User> GetUserByCpf(string cpf);
      public Task<int> CreateUser(User user);
      public Task AssignToken(string cpf, string userToken);
      public Task Logout(string username);
      public Task ResetPassword(string username, byte[] passwordHash, byte[] passwordSalt);
   }
}

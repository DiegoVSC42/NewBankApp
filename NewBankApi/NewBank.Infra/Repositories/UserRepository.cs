using Dapper;
using Microsoft.IdentityModel.Tokens;
using NewBank.Domain.Dtos.User;
using NewBank.Domain.Models;
using NewBank.Domain.Repositories;
using System.Data;

namespace NewBank.Infra.Repositories
{
   public class UserRepository : IUserRepository
   {
      private readonly IDbConnection _connection;

      public UserRepository(SqlConnectionProvider connectionProvider)
      {
         _connection = connectionProvider.GetDbConnection;
      }

      public async Task Logout(string username)
      {
         var query = @"UPDATE users SET userToken = null WHERE username = @username";
         await _connection.QueryAsync(query, new
         {
            username
         });
      }

      public async Task AssignToken(string username, string userToken)
      {
         var query = @"UPDATE users SET userToken = @userToken WHERE username = @username";
         await _connection.QueryAsync(query, new
         {
            userToken,
            username
         });
      }

      public async Task<User> GetUser(string username)
      {
         var query = @"SELECT * FROM users where username = @username";
         var user = await _connection.QueryFirstAsync<User>(query, new
         {
            username
         });
         return user;
      }

      public async Task<int> CreateUser(User user)
      {
         var query = @"INSERT INTO users 
                          (firstName, lastName, cpf, email, phone, passwordHash, passwordSalt, userToken, balance)
                          VALUES
                          (@firstName, @lastName, @cpf, @email, @phone, @passwordHash, @passwordSalt, @userToken, @balance)
                          RETURNING Id;";
         var id = await _connection.QueryFirstAsync<int>(query, param: new
         {
            firstName = user.FirstName,
            lastName = user.LastName,
            cpf = user.Cpf,
            email = user.Email,
            phone = user.Phone,
            passwordHash = user.PasswordHash,
            passwordSalt = user.PasswordSalt,
            userToken = user.UserToken,
            balance = user.Balance
         });
         return id;
      }

      public async Task ResetPassword(string username, byte[] passwordHash, byte[] passwordSalt)
      {
         var query = @"UPDATE users SET
                          passwordHash = @passwordHash,
                          passwordSalt = @passwordSalt
                          WHERE username = @username";
         await _connection.QueryAsync(query, new
         {
            username,
            passwordHash,
            passwordSalt
         });
      }
   }
}
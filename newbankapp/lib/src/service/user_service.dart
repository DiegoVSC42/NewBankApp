import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/user.dart';

class UserService {
  Future<User> register(String firstName, String lastName, String cpf,
      String email, String phone, String password) async {
    var url = Uri.parse('https://localhost:7242/api/Auth/register');

    Response? response;

    var headers = {'Content-Type': 'application/json', 'accept': 'text/plain'};
    var body = json.encode({
      'firstName': firstName,
      'lastName': lastName,
      'cpf': cpf,
      'email': email,
      'phone': phone,
      'password': password
    });

    try {
      response = await http.post(url, headers: headers, body: body);
    } catch (e) {
      rethrow;
    }

    return User.fromJson(response.body.toString());
  }

  Future<User> logIn(String cpf, String password) async {
    var url = Uri.parse('https://localhost:7242/api/Auth/login');
    var headers = {'Content-Type': 'application/json', 'accept': 'text/plain'};
    Response? response;

    var body = json.encode({'cpf': cpf, 'password': password});

    try {
      response = await http.post(url, headers: headers, body: body);
    } catch (e) {
      rethrow;
    }

    return User.fromJson(response.body);
  }
}

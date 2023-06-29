import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newbankapp/services/prefs_service.dart';
import 'package:newbankapp/src/feature/home/home_module.dart';

import '../../../../home/presentation/view/page/homepage.dart';

class LoginButton extends StatefulWidget {
  var username = "";
  var password = "";

  LoginButton({
    required this.username,
    required this.password,
    super.key,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  void login() async {
    print("logando usuário");
    var url = Uri.parse('https://10.0.2.2:7242/api/Auth/login');

    var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
            {'username': widget.username, 'password': widget.password}));

    if (response.statusCode == 200) {
      var user = jsonDecode(response.body);
      print("Nome Completo: " + user['firstame'] + " " + user['lastName']);
      print("Saldo: ");
      print(user['balance']);
      print("UserToken: " + user['userToken']);
      navigate(user['firstame'], user['lastName'], user['balance'],
          user['userToken']);
      PrefsService.save(widget.username);
    } else {
      print(response.body);
    }
  }

  void navigate(
      String firstName, String lastName, int balance, String userToken) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage(
                balance: balance,
                firstName: firstName,
                lastName: lastName,
                userToken: '',
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: login,
      child: const Text(
        "Login",
      ),
      style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(240, 40))),
    );
  }
}

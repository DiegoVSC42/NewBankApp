import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newbankapp/src/feature/home/home_module.dart';

import '../../../../../component/newbank_text.dart';
import '../../../../../component/newbank_textButton.dart';
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
    var url = Uri.parse(
        'https://localhost:7242/api/Auth/login'); // Replace with your own endpoint

    var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
            {'username': widget.username, 'password': widget.password}));

    if (response.statusCode == 200) {
      var user = jsonDecode(response.body);
      navigate(user['firstame'], user['lastName'], user['balance']);
    } else {
      print(response.body);
    }
  }

  void navigate(String firstName, String lastName, int balance) {
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
    return NewBankTextButton(
      onPressed: login,
      child: const NewBankText(
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}

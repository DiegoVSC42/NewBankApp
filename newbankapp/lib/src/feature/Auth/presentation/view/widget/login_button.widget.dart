import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newbankapp/src/store/user_store.dart';
import 'package:provider/provider.dart';

import '../../../../../model/user.dart';
import '../../../../home/presentation/view/page/homepage.dart';
import '../../../data/dto/login_dto.dart';

class LoginButton extends StatefulWidget {
  var cpf = "";
  var password = "";

  LoginButton({
    required this.cpf,
    required this.password,
    super.key,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  void login(BuildContext context) async {
    var request = LoginDto(widget.cpf, widget.password);

    final response = await Dio().post(
      'https://10.0.2.2:7242/api/Auth/login',
      data: request.toJson(),
    );

    if (response.statusCode == 200) {
      final user = User.fromJson(response.data.toString());
      // Provider.of<UserStore>(context, listen: false).setLoginResponse(user);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      throw Exception("Usuário ou Senha Inválidos!");
    }
  }

  void navigate(
      String firstName, String lastName, int balance, String userToken) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {login(context)},
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(240, 40))),
      child: const Text(
        "Login",
      ),
    );
  }
}

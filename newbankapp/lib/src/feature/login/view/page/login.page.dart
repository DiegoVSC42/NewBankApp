import 'package:flutter/material.dart';
import 'package:newbankapp/src/feature/login/view/widget/input.widget.dart';

import '../widget/login_button.widget.dart';

class Login extends StatelessWidget {
  var usernameCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NW",
          style: TextStyle(
            fontFamily: "Cormorant",
            fontWeight: FontWeight.bold,
            fontSize: 42,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 5,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: "Big Shoulders Display"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Input(
                    label: "Username",
                    ctrl: usernameCtrl,
                  ),
                  Input(
                    label: "Password",
                    ctrl: passwordCtrl,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LoginButton(
                    username: usernameCtrl.text,
                    password: passwordCtrl.text,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

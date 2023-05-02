import 'package:flutter/material.dart';
import 'package:newbankapp/src/feature/login/view/widget/input.widget.dart';

class Login extends StatelessWidget {
  var usernameCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 40,
                        fontFamily: "Big Shoulders Display"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Input(
              label: "Username",
              ctrl: usernameCtrl,
            ),
            Input(
              label: "Password",
              ctrl: passwordCtrl,
            ),
          ],
        ),
      ),
    );
  }
}

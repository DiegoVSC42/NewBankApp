import 'package:flutter/material.dart';

import '../../../login/view/widget/input.widget.dart';

class SignUp extends StatelessWidget {
  var firstNameTec = TextEditingController();
  var lastNameTec = TextEditingController();
  var usernameTec = TextEditingController();
  var cpfTec = TextEditingController();
  var emailTec = TextEditingController();
  var phoneTec = TextEditingController();
  var passwordTec = TextEditingController();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
                    "Sign Up",
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
                    label: "Firstname",
                    ctrl: firstNameTec,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    label: "Lastname",
                    ctrl: lastNameTec,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    label: "Cpf",
                    ctrl: cpfTec,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    label: "Email",
                    ctrl: emailTec,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    label: "Phone",
                    ctrl: phoneTec,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    label: "Username",
                    ctrl: usernameTec,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    label: "Password",
                    ctrl: passwordTec,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // LoginButton(
                  //   username: usernameCtrl.text,
                  //   password: passwordCtrl.text,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

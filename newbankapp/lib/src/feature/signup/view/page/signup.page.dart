import 'package:flutter/material.dart';

import '../../../login/view/widget/input.widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var firstNameTec = TextEditingController();

  var lastNameTec = TextEditingController();

  var usernameTec = TextEditingController();

  var cpfTec = TextEditingController();

  var emailTec = TextEditingController();

  var phoneTec = TextEditingController();

  var passwordTec = TextEditingController();

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
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: "Big Shoulders Display"),
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
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.indigo,
                      ),
                      child: const Text(
                        "Registrar",
                      ),
                    ),
                    // LoginButton(
                    //   username: usernameCtrl.text,
                    //   password: passwordCtrl.text,
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

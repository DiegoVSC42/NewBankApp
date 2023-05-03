import 'package:flutter/material.dart';
import 'package:newbankapp/src/feature/login/view/widget/input.widget.dart';

import '../widget/login_call.widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var usernameCtrl = TextEditingController();
  var username = "";
  var password = "";
  var passwordCtrl = TextEditingController();

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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontFamily: "Big Shoulders Display"),
                    ),
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
                  // LoginButton(
                  //   username: usernameCtrl.text,
                  //   password: passwordCtrl.text,
                  // )
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _updateUser(usernameCtrl.text, passwordCtrl.text);
                        print(username);
                        print(password);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateUser(String usernameR, String passwordR) {
    setState(() {
      username = usernameR;
      password = passwordR;
    });
  }
}

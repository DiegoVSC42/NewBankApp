import 'package:flutter/material.dart';
import 'package:newbankapp/src/component/newbank_bar.dart';

import '../../../../component/card_container.dart';
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
      appBar: NewBankBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: CardContainer(
              height: 675,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    Input(
                      label: "Lastname",
                      ctrl: lastNameTec,
                    ),
                    Input(
                      label: "CPF",
                      ctrl: cpfTec,
                    ),
                    Input(
                      label: "E-mail",
                      ctrl: emailTec,
                    ),
                    Input(
                      label: "Phone",
                      ctrl: phoneTec,
                    ),

                    Input(
                      label: "Username",
                      ctrl: usernameTec,
                    ),

                    Input(
                      label: "Password",
                      ctrl: passwordTec,
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
          ),
        ],
      ),
    );
  }
}

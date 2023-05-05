import 'package:flutter/material.dart';
import 'package:newbankapp/src/component/newbank_appbar.dart';
import 'package:newbankapp/src/component/newbank_textbutton.dart';

import '../../../../component/newbank_container.dart';
import '../../../../component/newbank_text.dart';
import 'input.widget.dart';

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
            child: NewBankContainer(
              height: 675,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const NewBankText(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: "Big Shoulders Display",
                        color: Colors.white,
                      ),
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

                    NewBankTextButton(
                      onPressed: () {},
                      child: const NewBankText(
                        "Registrar",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.indigo,
                        ),
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

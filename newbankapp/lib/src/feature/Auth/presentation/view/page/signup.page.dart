import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:newbankapp/src/component/newbank_appbar.dart';
import 'package:newbankapp/src/component/newbank_textbutton.dart';

import '../../../../../component/newbank_container.dart';
import '../../../../../component/newbank_text.dart';
import '../widget/input.widget.dart';

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
                      label: "firstname".i18n(),
                      ctrl: firstNameTec,
                    ),
                    Input(
                      label: "lastname".i18n(),
                      ctrl: lastNameTec,
                    ),
                    Input(
                      label: "CPF".i18n(),
                      ctrl: cpfTec,
                    ),
                    Input(
                      label: "email".i18n(),
                      ctrl: emailTec,
                    ),
                    Input(
                      label: "phone".i18n(),
                      ctrl: phoneTec,
                    ),

                    Input(
                      label: "username_sup".i18n(),
                      ctrl: usernameTec,
                    ),

                    Input(
                      label: "password_sup".i18n(),
                      ctrl: passwordTec,
                    ),

                    NewBankTextButton(
                      onPressed: () {},
                      child: NewBankText(
                        "sign_up_sup".i18n(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
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

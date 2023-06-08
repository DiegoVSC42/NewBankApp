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
  // VERIFIQUE REGEX EM
  // https://regexr.com/

  var firstNameTec = TextEditingController();

  var lastNameTec = TextEditingController();

  var cpfTec = TextEditingController();

  var emailTec = TextEditingController();

  var phoneTec = TextEditingController();

  var usernameTec = TextEditingController();

  // Minimum eight characters, at least one letter, one number and one special character:
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
                      regex: RegExp(r'\w+'),
                      obscureText: false,
                    ),
                    Input(
                      label: "lastname".i18n(),
                      ctrl: lastNameTec,
                      regex: RegExp(r'\w+'),
                      obscureText: false,
                    ),
                    Input(
                      label: "CPF".i18n(),
                      ctrl: cpfTec,
                      regex: RegExp(r'\d{11}'),
                      obscureText: false,
                    ),
                    Input(
                      label: "email".i18n(),
                      ctrl: emailTec,
                      regex: RegExp(
                          r'(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'),
                      obscureText: false,
                    ),
                    Input(
                      label: "phone".i18n(),
                      ctrl: phoneTec,
                      regex: RegExp(r'\d{11}'),
                      obscureText: false,
                    ),

                    Input(
                      label: "username_sup".i18n(),
                      ctrl: usernameTec,
                      regex: RegExp(r'\w{4,}'),
                      obscureText: false,
                    ),

                    Input(
                      label: "password_sup".i18n(),
                      ctrl: passwordTec,
                      regex: RegExp(
                          r'(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$'),
                      obscureText: true,
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

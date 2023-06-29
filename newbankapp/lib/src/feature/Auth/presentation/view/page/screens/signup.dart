import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:newbankapp/src/component/newbank_appbar.dart';
import 'package:newbankapp/src/component/newbank_box_card.dart';

import '../../widget/input.widget.dart';

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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewBankBar(
        automaticallyImplyLeading: true,
      ),
      body: NewBankBoxCard(
        boxContent: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "sign_up".i18n(),
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: "Big Shoulders Display",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Input(
                  label: "firstname".i18n(),
                  ctrl: firstNameTec,
                  regex: RegExp(r'\w+'),
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Input(
                  label: "lastname".i18n(),
                  ctrl: lastNameTec,
                  regex: RegExp(r'\w+'),
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Input(
                  label: "CPF".i18n(),
                  ctrl: cpfTec,
                  regex: RegExp(r'\d{11}'),
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Input(
                  label: "email".i18n(),
                  ctrl: emailTec,
                  regex: RegExp(
                      r'(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'),
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Input(
                  label: "phone".i18n(),
                  ctrl: phoneTec,
                  regex: RegExp(r'\d{11}'),
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Input(
                  label: "username_sup".i18n(),
                  ctrl: usernameTec,
                  regex: RegExp(r'\w{4,}'),
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Input(
                  label: "password_sup".i18n(),
                  ctrl: passwordTec,
                  regex: RegExp(
                      r'(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$'),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    formKey.currentState?.validate();
                  },
                  child: Text(
                    "sign_up_sup".i18n(),
                  ),
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(320, 40))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
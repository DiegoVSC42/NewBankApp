import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:newbankapp/src/component/newbank_appbar.dart';
import 'package:newbankapp/src/component/newbank_box_card.dart';

import 'package:newbankapp/src/feature/Auth/presentation/view/widget/login_button.widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var cpfCtrl = TextEditingController();
  var username = "";
  var password = "";
  var passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewBankBar(),
      body: Center(
        child: SizedBox(
          width: 480,
          height: 240,
          child: Builder(builder: (context) {
            return NewBankBoxCard(
              boxContent: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: cpfCtrl,
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        labelText: "username_lgn".i18n(),
                        hintText: "username_ht_lgn".i18n(),
                        labelStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: "Big Shoulders Display",
                      ),
                    ),
                    TextFormField(
                      controller: passwordCtrl,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        labelText: "password_lgn".i18n(),
                        labelStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: "Big Shoulders Display",
                      ),
                      obscureText: true,
                      obscuringCharacter: "•",
                    ),
                    LoginButton(
                      cpf: cpfCtrl.text,
                      password: passwordCtrl.text,
                    ),
                  ],
                ),
              ),
            );
          }),
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

import 'package:flutter/material.dart';
import 'package:newbankapp/src/component/newbank_container.dart';
import 'package:newbankapp/src/component/newbank_appbar.dart';
import 'package:newbankapp/src/component/newbank_text.dart';
import 'package:newbankapp/src/feature/home/view/page/homepage.dart';

import '../widget/login.page.dart';
import '../widget/signup.page.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewBankBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: NewBankContainer(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const NewBankText("Ja possui cadastro ?"),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.indigo,
                    fixedSize: const Size(
                      250,
                      25,
                    ),
                  ),
                  child: const NewBankText(
                    "Login",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: NewBankText("Criar nova conta"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.indigo,
                    fixedSize: const Size(
                      250,
                      25,
                    ),
                  ),
                  child: const NewBankText(
                    "SignUp",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }),
    );
  }
}

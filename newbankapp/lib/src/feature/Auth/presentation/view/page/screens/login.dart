import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:newbankapp/src/component/newbank_appbar.dart';
import 'package:newbankapp/src/component/newbank_box_card.dart';
import 'package:newbankapp/src/feature/Auth/presentation/view/widget/login_button.widget.dart';
import 'package:newbankapp/src/store/user_store.dart';
import 'package:provider/provider.dart';

import '../../../../../home/presentation/view/page/homepage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var cpfCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  Future<void> loginUser() async {
    // if (!_formKey.currentState!.validate()) {
    //   return;
    // }

    try {
      UserStore userStore = Provider.of<UserStore>(context, listen: false);
      print(cpfCtrl.text);
      print(passwordCtrl.text);

      await userStore.login(cpfCtrl.text, passwordCtrl.text);

      if (context.mounted) navigate();
      const Text('Cadastro feito com sucesso!');
    } catch (e) {
      rethrow;
    }
  }

  void navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewBankBar(
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: SizedBox(
          width: 480,
          height: 320,
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
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        labelText: "CPF".i18n(),
                        hintText: "CPF_ht".i18n(),
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
}

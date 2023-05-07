import 'package:flutter/material.dart';
import 'package:newbankapp/src/component/newbank_appbar.dart';
import 'package:http/http.dart' as http;
import 'package:newbankapp/src/component/newbank_text.dart';
import 'package:newbankapp/src/feature/Auth/presentation/view/widget/login_button.widget.dart';
import '../../../../../component/newbank_container.dart';
import '../../../../../component/newbank_textbutton.dart';

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
      appBar: NewBankBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: NewBankContainer(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: usernameCtrl,
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
                      labelText: "Nome de usuário",
                      hintText: "Ex: SeuNome123",
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      labelText: "Senha",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Big Shoulders Display",
                    ),
                    obscureText: true,
                    obscuringCharacter: "•",
                  ),
                  LoginButton(
                    username: usernameCtrl.text,
                    password: passwordCtrl.text,
                  ),
                ],
              ),
            ),
          ),
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

  // Widget _loginButton() {
  //   void login() {
  //     print("logando usuario...");
  //     print(username);
  //     print(password);
  //   }

  //   void funcaoAnterior() {
  //     _updateUser(usernameCtrl.text, passwordCtrl.text);
  //     _login(username, password);
  //   }

  //   void _login() async {
  //     var url = Uri.parse('http://localhost:7242/api/Auth/login');
  //     var response = await http.post(url,
  //         body: {'username': 'your-username', 'password': 'your-password'});
  //     if (response.statusCode == 200) {
  //       // Login successful, handle response here
  //     } else {
  //       // Login failed, handle error here
  //     }
  //   }

  //   return NewBankTextButton(
  //     onPressed: login,
  //     child: const NewBankText(
  //       "Login",
  //       style: TextStyle(
  //         color: Colors.white,
  //         fontSize: 16,
  //       ),
  //     ),
  //   );
  // }
}

import 'package:flutter/material.dart';
import 'package:newbankapp/src/component/newbank_appbar.dart';
import 'package:http/http.dart' as http;
import 'package:newbankapp/src/component/newbank_text.dart';
import '../../../../component/newbank_container.dart';
import '../../../../component/newbank_textbutton.dart';

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
                  _loginButton(),
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

  Widget _loginButton() {
    return NewBankTextButton(
      onPressed: () {
        _updateUser(usernameCtrl.text, passwordCtrl.text);
        _login(username, password);
      },
      child: const NewBankText(
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  void _login(String username, String password) async {
    var url = Uri.parse(
        'http://localhost:7242/api/Auth/login'); // Replace with your own endpoint
    var response = await http.post(url,
        body: {'username': 'your-username', 'password': 'your-password'});
    if (response.statusCode == 200) {
      // Login successful, handle response here
    } else {
      // Login failed, handle error here
    }
  }
}

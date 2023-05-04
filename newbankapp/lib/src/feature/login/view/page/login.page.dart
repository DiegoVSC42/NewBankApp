import 'package:flutter/material.dart';
import 'package:newbankapp/src/feature/login/view/widget/input.widget.dart';
import 'package:http/http.dart' as http;
import '../widget/login_call.widget.dart';

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
      appBar: AppBar(
        title: const Text(
          "NW",
          style: TextStyle(
            fontFamily: "Cormorant",
            fontWeight: FontWeight.bold,
            fontSize: 42,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            height: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.8),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: "Big Shoulders Display",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Input(
                        label: "Username:",
                        ctrl: usernameCtrl,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Input(
                        label: "Password:",
                        ctrl: passwordCtrl,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _loginButton(),
                    ),
                  ],
                ),
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
    return SizedBox(
      width: 200,
      height: 40,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        onPressed: () {
          _updateUser(usernameCtrl.text, passwordCtrl.text);
          _login(username, password);
        },
        child: const Text(
          "Login",
          style: TextStyle(
            color: Colors.indigo,
          ),
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

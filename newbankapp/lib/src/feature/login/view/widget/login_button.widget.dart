import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginButton extends StatefulWidget {
  var username = "";
  var password = "";

  LoginButton({
    required this.username,
    required this.password,
    super.key,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  void login() async {
    print(widget.username);
    print(widget.password);

    // var url = Uri.parse(
    //     'http://localhost:7242/api/Auth/login'); // Replace with your own endpoint
    // var response = await http.post(url,
    //     body: {'username': 'your-username', 'password': 'your-password'});
    // if (response.statusCode == 200) {
    //   // Login successful, handle response here
    // } else {
    //   // Login failed, handle error here
    // }
  }

  @override
  Widget build(BuildContext context) {
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
        onPressed: login,
        child: const Text(
          "Login",
          style: TextStyle(
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}

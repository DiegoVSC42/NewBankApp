import 'package:flutter/material.dart';
import 'package:newbankapp/src/feature/auth/presentation/view/page/screens/auth.dart';
import 'package:newbankapp/src/feature/auth/presentation/view/page/screens/login.dart';
import 'package:newbankapp/src/feature/auth/presentation/view/page/screens/signup.dart';

class AuthPage extends StatefulWidget {
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Auth(),
    );
  }
}

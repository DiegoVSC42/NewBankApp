import 'package:flutter/material.dart';
import 'package:newbankapp/src/feature/auth/presentation/view/page/screens/auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Auth(),
    );
  }
}

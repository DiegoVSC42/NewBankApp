import 'package:flutter/material.dart';
import 'package:newbankapp/src/component/newbank_appbar.dart';

class UserTransations extends StatelessWidget {
  const UserTransations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewBankBar(),
      backgroundColor: Colors.white30,
      body: const Center(
        child: Text(
          'Transations',
          style: TextStyle(
            fontSize: 48,
          ),
        ),
      ),
    );
  }
}

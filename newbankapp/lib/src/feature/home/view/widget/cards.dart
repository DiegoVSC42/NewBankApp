import 'package:flutter/material.dart';

class UserCards extends StatelessWidget {
  const UserCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _newbankBar(),
      backgroundColor: Colors.white30,
      body: const Center(
        child: Text(
          'Cards',
          style: TextStyle(
            fontSize: 48,
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _newbankBar() {
    return AppBar(
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
      automaticallyImplyLeading: false,
    );
  }
}

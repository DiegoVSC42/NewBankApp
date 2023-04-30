import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:localization/localization.dart';

class UserCards extends StatelessWidget {
  const UserCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _newbankBar(),
      backgroundColor: Colors.white30,
      body: Center(
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
      title: const Center(
        child: Text(
          "NW",
          style: TextStyle(
            fontFamily: "Cormorant",
            fontWeight: FontWeight.bold,
            fontSize: 42,
          ),
        ),
      ),
      backgroundColor: Colors.indigo,
      elevation: 5,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:localization/localization.dart';
import 'package:newbankapp/src/component/newbank_app_bar.dart';

class UserCards extends StatelessWidget {
  const UserCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _newbankBar("app_name".i18n()),
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

  PreferredSizeWidget _newbankBar(String text) {
    return NewBankAppBar(
      title: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "NW",
            style: TextStyle(
              fontFamily: "Cormorant",
              fontWeight: FontWeight.bold,
              fontSize: 42,
            ),
          ),
        ),
      ),
      elevation: 5,
    );
  }
}

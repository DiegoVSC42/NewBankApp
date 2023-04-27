import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:newbankapp/src/component/newbank_app_bar.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _newbankBar("app_name".i18n()),
    );
  }

  PreferredSizeWidget _newbankBar(String text) {
    return NewBankAppBar(
      title: Expanded(
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[400],
                image: DecorationImage(
                  image: Svg("lib/assets/images/user_placeholder.svg"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Olá, 'USER_NAME'",
                style: TextStyle(
                  fontFamily: "Cormorant",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      elevation: 5,
    );
  }
}

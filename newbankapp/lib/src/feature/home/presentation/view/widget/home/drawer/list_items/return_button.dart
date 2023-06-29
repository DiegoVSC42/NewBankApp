import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:newbankapp/src/feature/auth/presentation/view/page/authpage.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(Icons.keyboard_return),
        title: Text(
          "go_back".i18n(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          "leave_session".i18n(),
          style: Theme.of(context).textTheme.bodySmall,
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AuthPage()));
        });
  }
}

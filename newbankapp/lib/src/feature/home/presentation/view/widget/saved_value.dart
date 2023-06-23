import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class SavedValue extends StatelessWidget {
  String showedVaultValue;
  SavedValue({
    super.key,
    required this.showedVaultValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "saved_m".i18n(),
            ),
          ),
          Text(
            "R\$ $showedVaultValue",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

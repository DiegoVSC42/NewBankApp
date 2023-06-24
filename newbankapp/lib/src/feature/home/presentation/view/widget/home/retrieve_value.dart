import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class RetrieveValue extends StatefulWidget {
  double userBalance;
  double vaultValue;
  Function(double) updateBalance;
  Function(double) updateVaultValue;
  RetrieveValue({
    super.key,
    required this.userBalance,
    required this.vaultValue,
    required this.updateBalance,
    required this.updateVaultValue,
  });
  @override
  State<RetrieveValue> createState() => _RetrieveValueState();
}

class _RetrieveValueState extends State<RetrieveValue> {
  TextEditingController retrieveController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "withdraw".i18n(),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        controller: retrieveController,
                        decoration: InputDecoration(
                          labelText: "enter".i18n(),
                          hintText: "example".i18n(),
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (retrieveController.text.isNotEmpty) {
                if (widget.vaultValue >=
                    double.parse(retrieveController.text)) {
                  widget
                      .updateVaultValue(-double.parse(retrieveController.text));
                  widget.updateBalance(double.parse(retrieveController.text));
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "warning".i18n(),
                          textAlign: TextAlign.center,
                        ),
                        content: Text(
                          "warning_txt".i18n(),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text(
                              'OK',
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            });
          },
          child: Text(
            "withdraw_btn".i18n(),
          ),
        ),
      ],
    );
  }
}

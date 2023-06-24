import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class InvestValue extends StatefulWidget {
  double userBalance;
  double vaultValue;
  Function(double) updateBalance;
  Function(double) updateVaultValue;

  InvestValue({
    super.key,
    required this.userBalance,
    required this.vaultValue,
    required this.updateBalance,
    required this.updateVaultValue,
  });

  @override
  State<InvestValue> createState() => _InvestValueState();
}

class _InvestValueState extends State<InvestValue> {
  TextEditingController saveController = TextEditingController();
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
                    "invest".i18n(),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextFormField(
                        controller: saveController,
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
            setState(
              () {
                if (saveController.text.isNotEmpty) {
                  if (widget.userBalance >= double.parse(saveController.text)) {
                    // setState(() {
                    //   widget.vaultValue += double.parse(saveController.text);
                    //   widget.userBalance -= double.parse(saveController.text);
                    // });
                    widget.updateVaultValue(double.parse(saveController.text));
                    widget.updateBalance(-double.parse(saveController.text));
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            'Aviso',
                            textAlign: TextAlign.center,
                          ),
                          content: Text(
                            "greater".i18n(),
                          ),
                          actions: <Widget>[
                            Center(
                              child: Center(
                                child: ElevatedButton(
                                  child: Text(
                                    'OK',
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              },
            );
          },
          child: Text(
            "invest_btn".i18n(),
          ),
        ),
      ],
    );
  }
}

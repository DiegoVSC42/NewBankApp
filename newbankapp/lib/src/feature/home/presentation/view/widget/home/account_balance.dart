import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class AccountBalance extends StatefulWidget {
  double userBalance;

  AccountBalance({
    required this.userBalance,
    super.key,
  });

  @override
  State<AccountBalance> createState() => _AccountBalanceState();
}

class _AccountBalanceState extends State<AccountBalance> {
  ValueNotifier<bool> eyeListener = ValueNotifier(false);
  ValueNotifier<bool> pigListener = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "balance".i18n(),
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: eyeListener,
                  builder: (BuildContext context, bool selected, _) =>
                      IconButton(
                    iconSize: 36,
                    onPressed: () {
                      setState(() {
                        eyeListener.value = !eyeListener.value;
                      });
                    },
                    icon: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: selected
                          ? Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                              key: ValueKey("iconB"),
                            )
                          : Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.white,
                              key: ValueKey("iconA"),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AnimatedCrossFade(
            firstChild: Text(
              "R\$" + widget.userBalance.toStringAsFixed(2),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            secondChild: Text(
              "••••",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            crossFadeState: eyeListener.value
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 300),
          ),
        ],
      ),
    );
    ;
  }
}

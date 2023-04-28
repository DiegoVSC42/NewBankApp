import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:newbankapp/src/component/newbank_app_bar.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  ValueNotifier<bool> isSelected = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    double user_balance = 0;
    bool hidden_item = true;
    String showed_value = user_balance.toStringAsFixed(2);
    String hidden_value = "••••";

    return Scaffold(
      appBar: _newbankBar("app_name".i18n()),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          //color: Colors.amber,
          height: 120,
          width: 420,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.indigo[200],
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Saldo em conta corrente: ",
                        style: TextStyle(
                          // fontFamily: "Cormorant",
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    // Text(
                    //   "R\$: $final_value",
                    //   style: TextStyle(
                    //     fontFamily: "Cormorant",
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 24,
                    //   ),
                    AnimatedCrossFade(
                      firstChild: Text(
                        "R\$$showed_value",
                        style: TextStyle(
                          // fontFamily: "Cormorant",
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      secondChild: Text(
                        "$hidden_value",
                        style: TextStyle(
                          // fontFamily: "Cormorant",
                          fontWeight: FontWeight.bold,
                          fontSize: 42,
                        ),
                      ),
                      crossFadeState: isSelected.value
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 300),
                    ),
                  ],
                ),
                ValueListenableBuilder(
                  valueListenable: isSelected,
                  builder: (BuildContext context, bool selected, _) =>
                      IconButton(
                    iconSize: 36,
                    onPressed: () {
                      setState(() {
                        isSelected.value = !isSelected.value;
                      });
                    },
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: selected
                          ? const Icon(Icons.remove_red_eye,
                              key: ValueKey("iconA"))
                          : const Icon(Icons.remove_red_eye_outlined,
                              key: ValueKey("iconB")),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //BARRA SUPERIOR
  PreferredSizeWidget _newbankBar(String text) {
    return NewBankAppBar(
      title: Row(
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
      elevation: 5,
    );
  }
}

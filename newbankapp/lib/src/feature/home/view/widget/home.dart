import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:newbankapp/src/component/card_container.dart';
import 'package:newbankapp/src/component/newbank_app_bar.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  ValueNotifier<bool> eyeListener = ValueNotifier(false);
  ValueNotifier<bool> pigListener = ValueNotifier(false);
  double value = 0.0;
  TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double userBalance = 0;
    String showedValue = userBalance.toStringAsFixed(2);
    String hiddenValue = "••••";
    String showedVaultValue = (value).toStringAsFixed(2);
    return Scaffold(
      appBar: _newbankBar("app_name".i18n()),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // CARD DE SALDO EM CONTA CORRENTE
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardContainer(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Saldo em conta corrente: ",
                                style: TextStyle(
                                  // fontFamily: "Cormorant",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  overflow: TextOverflow.clip,
                                ),
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
                    AnimatedCrossFade(
                      firstChild: Text(
                        "R\$$showedValue",
                        style: const TextStyle(
                          // fontFamily: "Cormorant",
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      secondChild: Text(
                        hiddenValue,
                        style: const TextStyle(
                          // fontFamily: "Cormorant",
                          fontWeight: FontWeight.bold,
                          fontSize: 42,
                        ),
                      ),
                      crossFadeState: eyeListener.value
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 300),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //CARD DE VALOR GUARDADO
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CardContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Valor Guardado Atual:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Text(
                      "R\$ $showedVaultValue",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardContainer(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Guardar dinheiro",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: TextFormField(
                                  controller: valueController,
                                  decoration: const InputDecoration(
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                    ),
                                    hintText: ("Exemplo: 42.50"),
                                    hintStyle: TextStyle(color: Colors.black54),
                                    labelText:
                                        'Digite o valor que será guardado',
                                  ),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  cursorColor: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(valueController.text);
                  print(value);
                  setState(() {
                    value = double.parse(valueController.text) + value;
                  });
                },
                child: Text(
                  "Guardar",
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.indigo,
                ),
              ),
            ],
          ),
        ],
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
              image: const DecorationImage(
                image: Svg("lib/assets/images/user_placeholder.svg"),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
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

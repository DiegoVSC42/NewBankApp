import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:newbankapp/src/component/card_container.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  ValueNotifier<bool> eyeListener = ValueNotifier(false);
  ValueNotifier<bool> pigListener = ValueNotifier(false);
  //userBalance vai ser o valor de acordo com o banco de dados
  double _userBalance = 42;
  double _vaultValue = 0.0;
  TextEditingController saveController = TextEditingController();
  TextEditingController retrieveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String showedVaultValue = (_vaultValue).toStringAsFixed(2);
    return Scaffold(
      appBar: _newbankBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // CARD DE SALDO EM CONTA CORRENTE
          _accountBalance(_userBalance),
          //CARD DE VALOR GUARDADO
          _savedValue(showedVaultValue),
          //CARD PARA GUARDAR VALOR
          _saveValue(),

          _retrieveValue(_userBalance),
        ],
      ),
    );
  }

  //BARRA SUPERIOR
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
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
          child: SizedBox(
            height: 42,
            child: Row(
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
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.indigo,
      elevation: 5,
      automaticallyImplyLeading: false,
    );
  }

  // CARD DE SALDO EM CONTA CORRENTE
  Widget _accountBalance(double userBalance) {
    String showedValue = userBalance.toStringAsFixed(2);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CardContainer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
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
              secondChild: const Text(
                "••••",
                style: TextStyle(
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
    );
  }

  //CARD DE VALOR GUARDADO
  Widget _savedValue(String showedVaultValue) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CardContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
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
    );
  }

  //CARD PARA GUARDAR VALOR
  Widget _saveValue() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CardContainer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
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
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          controller: saveController,
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: ("Exemplo: 42.50"),
                            hintStyle: TextStyle(color: Colors.black54),
                            labelText: 'Digite o valor que será guardado',
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
        ElevatedButton(
          onPressed: () {
            setState(() {
              _updateVaultValue(double.parse(saveController.text));
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
    );
  }

  //CARD PARA RESGATAR VALOR
  Widget _retrieveValue(double userBalance) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CardContainer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Resgatar dinheiro",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          controller: retrieveController,
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            hintText: ("Exemplo: 42.50"),
                            hintStyle: TextStyle(color: Colors.black54),
                            labelText: 'Digite o valor que será resgatado',
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
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (_vaultValue >= double.parse(retrieveController.text)) {
                _updateVaultValue(-double.parse(retrieveController.text));
                _updateBalance(double.parse(retrieveController.text));
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Aviso',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: Text('Valor maior do que o valor guardado!'),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'OK',
                            style: TextStyle(
                              color: Colors.indigo,
                            ),
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
            });
          },
          child: const Text(
            "Resgatar",
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.indigo,
          ),
        ),
      ],
    );
  }

  //MÉTODO PARA ATUALIZAR O SALDO DA CONTA
  void _updateBalance(double value) {
    setState(() {
      _userBalance += value;
    });
  }

  //MÉTODO PARA ATUALIZAR O SALDO GUARDADO
  void _updateVaultValue(double value) {
    setState(() {
      _vaultValue += value;
    });
  }
}

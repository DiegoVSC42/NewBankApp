import 'package:flutter/material.dart';
import 'package:newbankapp/src/component/newbank_container.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:newbankapp/src/component/newbank_text.dart';
import 'package:newbankapp/src/component/newbank_textbutton.dart';
import '../../../../../component/newbank_appbar.dart';

class UserHome extends StatefulWidget {
  var firstName = "";
  var lastName = "";
  var balance = 0;
  var userToken = "";

  UserHome({
    required this.firstName,
    required this.lastName,
    required this.balance,
    required this.userToken,
    super.key,
  });

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
          //CARD PARA RESGATAR VALOR
          _retrieveValue(_userBalance),
        ],
      ),
    );
  }

  //BARRA SUPERIOR
  PreferredSizeWidget _newbankBar() {
    return NewBankBar(
      title: const NewBankText(
        "NW",
        style: TextStyle(
          fontFamily: "Cormorant",
          fontWeight: FontWeight.bold,
          fontSize: 42,
        ),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
          child: SizedBox(
            height: 42,
            child: Row(
              children: [
                NewBankContainer(
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
                  child: NewBankText(
                    "Olá, usuário",
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
      automaticallyImplyLeading: true,
    );
  }

  // CARD DE SALDO EM CONTA CORRENTE
  Widget _accountBalance(double userBalance) {
    String showedValue = userBalance.toStringAsFixed(2);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: NewBankContainer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: NewBankText(
                        "Saldo em conta corrente: ",
                        style: TextStyle(
                          // fontFamily: "Cormorant",
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          overflow: TextOverflow.clip,
                          color: Colors.white,
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
                            ? const Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                                key: ValueKey("iconB"),
                              )
                            : const Icon(
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
              firstChild: NewBankText(
                "R\$$showedValue",
                style: const TextStyle(
                  // fontFamily: "Cormorant",
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
              secondChild: const NewBankText(
                "••••",
                style: TextStyle(
                  // fontFamily: "Cormorant",
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                  color: Colors.white,
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
      child: NewBankContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: NewBankText(
                "Valor Guardado Atual:",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            NewBankText(
              "R\$ $showedVaultValue",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.white,
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
          child: NewBankContainer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: NewBankText(
                      "Guardar dinheiro",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          controller: saveController,
                          decoration: InputDecoration(
                            labelText: "Digite o valor que será guardado:",
                            hintText: "Exemplo: 42.50",
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        NewBankTextButton(
          onPressed: () {
            setState(
              () {
                if (saveController.text.isNotEmpty) {
                  if (_userBalance >= double.parse(saveController.text)) {
                    _updateVaultValue(double.parse(saveController.text));
                    _updateBalance(-double.parse(saveController.text));
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const NewBankText(
                            'Aviso',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                          content: const NewBankText(
                            'Valor maior do que o saldo em conta!',
                            style: TextStyle(
                              color: Colors.indigo,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const NewBankText(
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
                }
              },
            );
          },
          child: const NewBankText(
            "Guardar",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
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
          child: NewBankContainer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: NewBankText(
                      "Resgatar dinheiro",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          controller: retrieveController,
                          decoration: InputDecoration(
                            labelText: "Digite o valor que será resgatado:",
                            hintText: "Exemplo: 42.50",
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                            labelStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        NewBankTextButton(
          onPressed: () {
            setState(() {
              if (retrieveController.text.isNotEmpty) {
                if (_vaultValue >= double.parse(retrieveController.text)) {
                  _updateVaultValue(-double.parse(retrieveController.text));
                  _updateBalance(double.parse(retrieveController.text));
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const NewBankText(
                          'Aviso',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                        content: const NewBankText(
                          'Valor maior do que o valor guardado!',
                          style: TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const NewBankText(
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
              }
            });
          },
          child: const NewBankText(
            "Resgatar",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
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

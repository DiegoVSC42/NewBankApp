import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:newbankapp/src/component/newbank_box_card.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/new_bank_bar.dart';

class UserHome extends StatefulWidget {
  // var firstName = "";
  // var lastName = "";
  // var balance = 0;
  // var userToken = "";

  UserHome({
    // required this.firstName,
    // required this.lastName,
    // required this.balance,
    // required this.userToken,
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
      appBar: homeBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // CARD DE SALDO EM CONTA CORRENTE
          Padding(
            padding: EdgeInsets.all(16.0),
            child: NewBankBoxCard(boxContent: _accountBalance(_userBalance)),
          ),
          //CARD DE VALOR GUARDADO
          Padding(
            padding: EdgeInsets.all(16.0),
            child: NewBankBoxCard(boxContent: _savedValue(showedVaultValue)),
          ),
          //CARD PARA GUARDAR VALOR
          Padding(
            padding: EdgeInsets.all(16.0),
            child: NewBankBoxCard(boxContent: _saveValue()),
          ),
          //CARD PARA RESGATAR VALOR
          Padding(
            padding: EdgeInsets.all(16.0),
            child: NewBankBoxCard(boxContent: _retrieveValue(_userBalance)),
          ),
        ],
      ),
    );
  }

  // CARD DE SALDO EM CONTA CORRENTE
  Widget _accountBalance(double userBalance) {
    String showedValue = userBalance.toStringAsFixed(2);
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
              "R\$ $showedValue",
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
  }

  //CARD DE VALOR GUARDADO
  Widget _savedValue(String showedVaultValue) {
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

  //CARD PARA GUARDAR VALOR
  Widget _saveValue() {
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
                  if (_userBalance >= double.parse(saveController.text)) {
                    _updateVaultValue(double.parse(saveController.text));
                    _updateBalance(-double.parse(saveController.text));
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

  //CARD PARA RESGATAR VALOR
  Widget _retrieveValue(double userBalance) {
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
                if (_vaultValue >= double.parse(retrieveController.text)) {
                  _updateVaultValue(-double.parse(retrieveController.text));
                  _updateBalance(double.parse(retrieveController.text));
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

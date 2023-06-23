import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:newbankapp/src/component/newbank_box_card.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/account_balance.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/invest_value.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/new_bank_bar.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/retrieve_value.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/saved_value.dart';

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
  //userBalance vai ser o valor de acordo com o banco de dados
  double userBalance = 42;
  double vaultValue = 0.0;
  TextEditingController retrieveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String showedVaultValue = (vaultValue).toStringAsFixed(2);
    return Scaffold(
      appBar: homeBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // CARD DE SALDO EM CONTA CORRENTE
          NewBankBoxCard(boxContent: AccountBalance(userBalance: userBalance)),
          //CARD DE VALOR GUARDADO
          NewBankBoxCard(
            boxContent: SavedValue(showedVaultValue: showedVaultValue),
          ),
          //CARD PARA GUARDAR VALOR
          NewBankBoxCard(
            boxContent: InvestValue(
              userBalance: userBalance,
              vaultValue: vaultValue,
              updateBalance: _updateBalance,
              updateVaultValue: _updateVaultValue,
            ),
          ),
          //CARD PARA RESGATAR VALOR
          NewBankBoxCard(
            boxContent: RetrieveValue(
              userBalance: userBalance,
              vaultValue: vaultValue,
              updateBalance: _updateBalance,
              updateVaultValue: _updateVaultValue,
            ),
          ),
        ],
      ),
    );
  }

  //MÉTODO PARA ATUALIZAR O SALDO DA CONTA
  void _updateBalance(double value) {
    setState(() {
      userBalance += value;
    });
  }

  //MÉTODO PARA ATUALIZAR O SALDO GUARDADO
  void _updateVaultValue(double value) {
    setState(() {
      vaultValue += value;
    });
  }
}

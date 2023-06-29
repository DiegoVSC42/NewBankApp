import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:localization/localization.dart';
import 'package:newbankapp/src/component/newbank_box_card.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/home/account_balance.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/home/drawer/home_drawer.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/home/invest_value.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/home/retrieve_value.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/home/saved_value.dart';
import 'package:newbankapp/src/feature/home/presentation/view/widget/home/home_bar.dart';

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
      appBar: HomeBar(
        //TODO colocar valor do backend
        Svg("lib/assets/images/user_placeholder.svg"),
        "user",
      ),
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
      drawer: HomeDrawer(
        //TODO Trocar por dados do backend
        image: Svg("lib/assets/images/user_placeholder.svg"),
        username: "User",
        accountNumber: "0000000-0",
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

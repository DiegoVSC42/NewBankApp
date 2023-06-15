import 'package:flutter/material.dart';
import 'package:newbankapp/src/component/newbank_appbar.dart';

class UserTransations extends StatelessWidget {
  const UserTransations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NewBankBar(),
        backgroundColor: Colors.white30,
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Qual é o valor da  transferência?",
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text("Saldo disponível em conta: R\$ 18,54"),
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

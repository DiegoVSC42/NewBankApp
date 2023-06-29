import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:newbankapp/src/component/newbank_appbar.dart';
//import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:newbankapp/src/component/newbank_formcard.dart';

class UserCards extends StatelessWidget {
  const UserCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewBankBar(),
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15)),
            child: SizedBox(
              width: 100,
              height: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(.5),
                      ),
                      child: const Icon(Icons.lock_outline),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Cartão Virtual não gerado"),
                  )
                ],
              ),
            ),
          ),
          buildPaymentCardWidget(context, Color(0xF25FFFFF), Color(0xFF2508FF)),
          buildPaymentCardWidget(context, Color(0xFFFF9800), Color(0xFF9C2700)),
          buildPaymentCardWidget(context, Color(0xFF76FF03), Color(0xFF33691E)),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FormCard()),
            );
          },
          child: const Icon(color: Colors.white, Icons.add)),
    );
  }

  Widget buildPaymentCardWidget(
      BuildContext context, Color color1, Color color2) {
    return FlipCard(
      direction: FlipDirection.VERTICAL,
      front: buildFrontFace(context, color1, color2),
      back: buildBackFace(context, color1, color2),
    );
  }

  Widget buildFrontFace(BuildContext context, Color color1, Color color2) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      // Parte da frente do cartão
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: <Color>[color1, color2]),
            borderRadius: BorderRadius.circular(15)),
        width: 100,
        height: 230,
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              right: 25,
              child: SizedBox(
                width: 60,
                height: 60,
                child: Image.asset(
                  "lib/assets/images/visa-logo.png",
                ),
              ),
            ),
            const Positioned(
              top: 20,
              right: 10,
              child: SizedBox(
                width: 60,
                height: 60,
                child: Text(
                  "12/50",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            const Positioned(
              top: 20,
              left: 25,
              child: Text(
                "NEW BANK",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const Positioned(
              bottom: 55,
              left: 25,
              child: Text(
                "1234   XXXX   XXXX   XXXX",
                style: TextStyle(color: Colors.white, fontSize: 17.5),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 25,
              child: Text(
                "NAME TEST CARD",
                style: TextStyle(color: Colors.grey[200], fontSize: 14.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBackFace(BuildContext context, Color color1, Color color2) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      // Parte de Trás do Cartão
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                // Configuração de cor gradiente
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: <Color>[color1, color2]), // Aplicação de Cor Gradiente
            borderRadius: BorderRadius.circular(15)), // Bordas do cartão
        // Tamanho do Cartão
        width: 100, // Largura
        height: 230, // Altura
        child: Stack(
          // Pilha para os cartões
          children: [
            // Texto do Topo de cada cartão
            const Positioned(
              top: 20,
              left: 25,
              child: Text(
                "LOST OR STOLEN, RETURN TO ANY BRANCH OF YOUR BANK.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 11.0), // Estilo do texto do topo
              ),
            ),

            // Faixa preta do cartão
            Positioned(
              top: 45,
              left: 0,
              child: Container(
                width: 400,
                height: 40,
                color: Colors.black,
              ),
            ),
            // Faixa Branca do cartão
            Positioned(
              top: 100,
              left: 10,
              right: 50,
              child: Container(
                width: 10,
                height: 40,
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    child: const Padding(
                      padding: EdgeInsets.only(right: 7),
                      child: Text(
                        "XXX",
                        style: TextStyle(color: Colors.black, fontSize: 12.25),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Parte Inferior
            const Positioned(
              bottom: 20,
              left: 25,
              child: Text(
                "ISSUED BY YOUR BANK.",
                style: TextStyle(color: Colors.white, fontSize: 12.25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

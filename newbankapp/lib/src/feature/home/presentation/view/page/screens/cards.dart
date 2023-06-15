import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:newbankapp/src/component/newbank_appbar.dart';

class UserCards extends StatelessWidget {
  const UserCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewBankBar(),
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.transparent,
        height: 600,
        width: 400,
        child: ListView(children: [
          buildPaymentCardWidget(context, Color(0xF25FFFFF), Color(0xFF2508FF)),
          buildPaymentCardWidget(context, Color(0xFFFF9800), Color(0xFF9C2700)),
          buildPaymentCardWidget(context, Color(0xFF76FF03), Color(0xFF9C27B0)),
        ]),
      ),
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
              child: Container(
                width: 60,
                height: 60,
                child: Image.asset(
                  "lib/assets/images/visa-logo.png",
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 10,
              child: Container(
                width: 60,
                height: 60,
                child: const Text(
                  "12/50",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            const Positioned(
              top: 20,
              left: 25,
              child: Text(
                "DEMO BANK",
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
                "VIJAY CREATIONS",
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
                "LOST OR STOLEN, PLEASE RETURN TO ANY BRANCH OF YOUR BANK.",
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

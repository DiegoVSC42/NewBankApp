import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:newbankapp/src/feature/home/presentation/view/page/screens/cards.dart';
import 'newbank_appbar.dart';

class FormCard extends StatefulWidget {
  const FormCard({Key? key}) : super(key: key);

  @override
  State<FormCard> createState() => _FormCardPageState();
}

// Controller para cada Tipo de Item
class _FormCardPageState extends State<FormCard> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderNameController =
      TextEditingController();
  final TextEditingController cardExpiryDateController =
      TextEditingController();
  final TextEditingController cardCvvController = TextEditingController();

  final FlipCardController flipCardController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewBankBar(
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              FlipCard(
                  fill: Fill.fillFront,
                  direction: FlipDirection.HORIZONTAL,
                  controller:
                      flipCardController, // Controller para cada Tipo de Item (Flip Card)
                  onFlip: () {
                    print('Flip');
                  },
                  //flipOnTouch: false,
                  onFlipDone: (isFront) {
                    print('isFront: $isFront');
                  },
                  //Parte da Frente
                  front: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // Parte da frente do cartão
                        child: Container(
                          decoration: BoxDecoration(
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ),
                              const Positioned(
                                top: 20,
                                left: 25,
                                child: Text(
                                  "NEW BANK",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              const Positioned(
                                bottom: 55,
                                left: 25,
                                child: Text(
                                  "1234   XXXX   XXXX   XXXX",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17.5),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 25,
                                child: Text(
                                  "NAME TEST CARD",
                                  style: TextStyle(
                                      color: Colors.grey[200], fontSize: 14.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  //
                  // Parte de Trás
                  back: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 230,
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
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.25),
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
                                "ISSUED BY NEW BANK.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              // Espaço entre cartão e caixas de texto
              const SizedBox(height: 40),
              // Caixa de Texto Card Number
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Cor de fundo da caixa de texto
                  borderRadius: BorderRadius.circular(15),
                ),
                // Caixa de Texto Full Name
                child: TextFormField(
                  controller:
                      cardNumberController, // Controller para cada Tipo de Item (Card Number)
                  keyboardType:
                      TextInputType.number, // Input Keyboard para Números
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    hintText: 'Card Number',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    // Ícone de Indentificação
                    prefixIcon: Icon(
                      Icons.credit_card,
                      color: Colors.grey,
                    ),
                  ),
                  // Formato para apenas 16 digitos
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                  ],
                  //
                ),
              ),
              const SizedBox(height: 12),
              // Caixa de Texto Full Name
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Cor de fundo da caixa de texto
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller:
                      cardHolderNameController, // Controller para cada Tipo de Item (Full Name)
                  keyboardType: TextInputType.name, // Input Keyboard para Nomes
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    hintText: 'Full Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    // Ícone de Indentificação
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Caixa de Texto Mês e Ano
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width / 2.4,
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Cor de fundo da caixa de texto
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller:
                          cardExpiryDateController, // Controller para cada Tipo de Item (MM / YY)
                      keyboardType:
                          TextInputType.number, // Input Keyboard para Números
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        hintText: 'MM/YY',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        // Ícone de Indentificação
                        prefixIcon: Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                        ),
                      ),
                      // Formato para colocar apenas 4 digitos
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        //CardDateInputFormatter(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Caixa de Texto para Código CVV
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width / 2.4,
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Cor de fundo da caixa de texto
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller:
                          cardCvvController, // Controller para cada Tipo de Item (Card CVV)
                      keyboardType:
                          TextInputType.number, // Input Keyboard para Números
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        hintText: 'CVV',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        // Ícone de Indentificação
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                      ),
                      // Formato para colocar apenas 3 digitos
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      // Para Flipar o Card sempre que clicar no CVV
                      onTap: () {
                        setState(() {
                          Future.delayed(const Duration(milliseconds: 300), () {
                            flipCardController.toggleCard();
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              // Botão de adicionar card
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width / 1.12, 55),
                ),
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 300), () {});
                },
                child: Text(
                  'Add Card'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 230,
                      ),
                    ),
                  ),
                  // Parte de Trás
                  back: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: 230,
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

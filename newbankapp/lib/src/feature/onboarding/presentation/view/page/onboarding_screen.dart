import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:newbankapp/src/feature/auth/presentation/view/page/screens/auth.dart';
import 'package:localization/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

// StatefulWidget
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

// Classe principal para onboard screen
class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController? _controller;
  int currentIndex = 0;
  double percentage = 0.25;

  //final introKey = GlobalKey<IntroductionScreenState>();

  @override // InitState
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    // Implementação dispose
    super.dispose();
  }

// Tamanho principal e geral das imagens de toda a onboard
  Widget _buildImage(String assetName, [double width = 200]) {
    return Image.asset('lib/assets/images/$assetName', width: width);
  }

  @override //Widget para aplicar o tamanho da fonte e a cor da Frase
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 28.0,
    );

    const pageDecoration = PageDecoration(
      //Tamanho e cor da Fonte e o negrito do título
      titleTextStyle: TextStyle(
        fontSize: 39.0,
        fontWeight: FontWeight.w700,
        height: 2.3,
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(
          16.0, 10.0, 16.0, 16.0), // Posição da Frase //Cor do Fundo da página
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      animationDuration: 350,
      //key: introKey,
      pages: [
        // Cada página da onboard (Page View Model)
        PageViewModel(
          title: "welcome".i18n(), // Título
          body: "phrase_ob1".i18n(), // Frase
          image: _buildImage('imagem-1.png'), //Imagem utilizada
          decoration:
              pageDecoration, // Uso do container para cada página (Manter o mesmo padrão)
        ),

        PageViewModel(
          title: '',
          body: "phrase_ob2".i18n(),
          image: _buildImage('imagem-2.png'),
          decoration: pageDecoration,
        ),

        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "phrase_ob3".i18n(),
                    style: const TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  openAuthScreen(context);
                  _skipOnboarding();
                },
                // Aplica um estilo a Barra
                style: ElevatedButton.styleFrom(
                  // Elevado
                  minimumSize: const Size.fromHeight(
                      80), //Aumenta a barra (Vertical)// Muda a cor
                  //Aplica o estido de borda da barra
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(40.0), //Quão redondo aplica
                  ),
                ),
                //Qual texto coloca na barra
                child: Text(
                  "phrase_ob4".i18n(),
                  style: const TextStyle(
                    fontSize: 16.0,
                  ), //Cor do texto
                ),
              ),
            ],
          ),
          image: _buildImage('imagem-3.png'),
          // Barra do Vamos Começar

          decoration: pageDecoration,
        ),
      ],
      //
      showBackButton: false,
      showSkipButton: true,
      showDoneButton: false,

      nextFlex: 1, // Posição de quando aperta em Próximo
      // Botão de Pular
      skip: Text('skip'.i18n(),
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          )),
      // Botão de Voltar
      back: Text('back'.i18n(),
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          )),
      // Botão de Próximo
      next: Text('next'.i18n(),
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          )),

      //
      curve: Curves.linear, //Estilo de passagem de páginas
      //
      controlsMargin: const EdgeInsets.all(17), //Margem até os botões
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      // Estilo das bolinhas
      dotsDecorator: const DotsDecorator(
        size: Size(8.0, 8.0), //Tamanho
        color: Color.fromARGB(255, 194, 200, 235), // Cor do Fundo
        activeSize: Size(12.0, 12.0), // Tamanho de quando está em cima
        activeColor: Colors.white, // Cor de quando está em cima
        // Estilo de quando está em cima
        activeShape: RoundedRectangleBorder(
          // Estilo e quão redondo aplica nas bordas
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

//Criar uma função para abrir a tela inicial, mesma função para chamar no botão pular
void openAuthScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Auth()),
  );
}

_skipOnboarding() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("FIRST_TIME", false);
}

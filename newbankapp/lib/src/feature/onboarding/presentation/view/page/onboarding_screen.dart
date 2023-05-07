import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:newbankapp/src/feature/auth/presentation/view/page/auth.page.dart';
import 'package:localization/localization.dart';

// StatefulWidget
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

// Classe principal para onboard screen
class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override // Remover barra de Status do Android (transparente)
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    super.initState();
  }

// Tamanho principal e geral das imagens de toda a onboard
  Widget _buildImage(String assetName, [double width = 200]) {
    return Image.asset('lib/assets/images/$assetName', width: width);
  }

  @override //Widget para aplicar o tamanho da fonte e a cor da Frase
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 28.0, color: Colors.white);

    const pageDecoration = PageDecoration(
      //Tamanho e cor da Fonte e o negrito do título
      titleTextStyle: TextStyle(
        fontSize: 39.0,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        height: 2.3,
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding:
          EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0), // Posição da Frase
      pageColor: Colors.indigo, //Cor do Fundo da página
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      animationDuration: 350,
      key: introKey,
      globalBackgroundColor: Colors.indigo,
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
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "phrase_ob3".i18n(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  openAuthScreen(context);
                },
                // Aplica um estilo a Barra
                style: ElevatedButton.styleFrom(
                  // Elevado
                  minimumSize:
                      const Size.fromHeight(80), //Aumenta a barra (Vertical)
                  backgroundColor: Colors.white, // Muda a cor
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
                    color: Colors.indigo,
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
      showBackButton: true,
      showSkipButton: false,
      showDoneButton: false,

      nextFlex: 1, // Posição de quando aperta em Próximo
      // Botão de Pular
      skip: Text('skip'.i18n(),
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white)),
      // Botão de Voltar
      back: Text('back'.i18n(),
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white)),
      // Botão de Próximo
      next: Text('next'.i18n(),
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white)),
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

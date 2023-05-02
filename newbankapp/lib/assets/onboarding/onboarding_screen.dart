import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:newbankapp/src/feature/Auth/view/page/auth.page.dart';

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
        const SystemUiOverlayStyle(statusBarColor: Colors.indigo));
    super.initState();
  }

// Tamanho principal e geral das imagens de toda a onboard
  Widget _buildImage(String assetName, [double width = 200]) {
    return Image.asset('lib/assets/images/$assetName', width: width);
  }

  @override //Widget para aplicar o tamanho da fonte e a cor da Frase
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 30.0, color: Colors.indigo);

    const pageDecoration = PageDecoration(
      //Tamanho e cor da Fonte e o negrito do título
      titleTextStyle: TextStyle(
        fontSize: 39.0,
        color: Colors.indigo,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding:
          EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0), // Posição da Frase
      pageColor: Colors.white, //Cor do Fundo da página
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        // Cada página da onboard (Page View Model)
        PageViewModel(
          title: "Bem-Vindo", // Título

          body: "Veja seu saldo a qualquer momento.", // Frase
          image: _buildImage('imagem-1.png'), //Imagem utilizada
          decoration:
              pageDecoration, // Uso do contrutor para cada página (Manter o mesmo padrão)
        ),

        PageViewModel(
          title: '',
          body:
              "Crie uma poupança e guarde qualquer quantia da sua conta nela.",
          image: _buildImage('imagem-2.png'),
          decoration: pageDecoration,
        ),

        PageViewModel(
          title: "",
          bodyWidget: Column(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    " Faça compras online com seu cartão digital.",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  openAuthScreen(context);
                },
                // Aplica um stilo a Barra
                style: ElevatedButton.styleFrom(
                  // Elevado
                  minimumSize:
                      const Size.fromHeight(80), //Aumenta a barra (Vertical)
                  backgroundColor: Colors.indigo, // Muda a cor
                  //Aplica o estido de borda da barra
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), //Quão redondo aplica
                  ),
                ),
                //Quual texto colocana barra
                child: const Text(
                  'VAMOS COMEÇAR !',
                  style: TextStyle(
                      color: Colors.white, fontSize: 15.5), //Cor do texto
                ),
              ),
            ],
          ),
          image: _buildImage('imagem-3.png'),
          // Barra do Vamos Começar

          decoration: pageDecoration,
        ),
      ],
      showBackButton: true,
      showSkipButton: false,
      showDoneButton: false,
      //skipOrBackFlex: 0,
      nextFlex: 1, // Posição de quando aperta em Próximo
      // Botão de Pular
      skip: const Text('Pular',
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.indigo)),
      // Botão de Voltar
      back: const Text('Voltar',
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.indigo)),
      // Botão de Próximo
      next: const Text('Próximo',
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.indigo)),
      //
      curve: Curves.fastLinearToSlowEaseIn, // Atraso para passar as páginas
      //
      controlsMargin: const EdgeInsets.all(16), //Margem até os botões
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      // Estilo das bolinhas
      dotsDecorator: const DotsDecorator(
        size: Size(8.0, 8.0), //Tamanho
        color: Color.fromARGB(255, 185, 193, 240), // Cor do Fundo
        activeSize: Size(15.0, 5.0), // Tamanho de quando está em cima
        activeColor: Colors.indigo, // Cor de quando está em cima
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

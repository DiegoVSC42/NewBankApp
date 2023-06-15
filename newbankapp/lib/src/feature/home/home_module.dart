import 'package:flutter_modular/flutter_modular.dart';
import 'package:newbankapp/src/feature/home/presentation/view/page/homepage.dart';
import 'package:newbankapp/src/feature/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:newbankapp/src/feature/onboarding/presentation/view/page/onboarding_screen.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => HomeViewModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        //TODO CHAMAR ONBOARDING SCREEN
        //   ChildRoute(
        //     '/',
        //     child: (_, __) => HomePage(
        //         firstName: "Diego",
        //         lastName: "Vieira",
        //         balance: 10000,
        //         userToken: "a"),
        //   ),
        // ];
        ChildRoute('/', child: (_, __) => OnboardingScreen()),
      ];

  /* @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
      ]; */
}

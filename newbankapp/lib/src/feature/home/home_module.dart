import 'package:flutter_modular/flutter_modular.dart';
import 'package:newbankapp/src/feature/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:newbankapp/src/feature/onboarding/presentation/view/page/onboarding_screen.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => HomeViewModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const OnboardingScreen()),
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
      ];
}

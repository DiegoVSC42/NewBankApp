import 'package:flutter_modular/flutter_modular.dart';
import 'package:newbankapp/src/feature/auth/presentation/view/page/authpage.dart';
import 'package:newbankapp/src/feature/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:newbankapp/src/feature/home/presentation/view/page/homepage.dart';
import 'package:newbankapp/src/feature/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:newbankapp/src/feature/onboarding/presentation/view/page/onboarding_screen.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => AuthViewModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => OnboardingScreen()),
      ];

  /* @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
      ]; */
}

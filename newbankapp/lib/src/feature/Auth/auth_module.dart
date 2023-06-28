import 'package:flutter_modular/flutter_modular.dart';

import 'package:newbankapp/src/feature/auth/presentation/view/page/screens/auth.dart';
import 'package:newbankapp/src/feature/auth/presentation/viewmodel/auth_viewmodel.dart';

import 'package:newbankapp/src/feature/onboarding/presentation/view/page/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthModule extends Module {
  bool firstTime;
  AuthModule({
    required this.firstTime,
  });

  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => AuthViewModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        firstTime
            ? ChildRoute('/', child: (_, __) => const OnboardingScreen())
            : ChildRoute('/', child: (_, __) => const Auth())
      ];
}

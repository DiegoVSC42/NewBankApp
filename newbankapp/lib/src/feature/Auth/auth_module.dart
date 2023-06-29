import 'package:flutter_modular/flutter_modular.dart';
import 'package:newbankapp/src/feature/auth/presentation/view/page/authpage.dart';
import 'package:newbankapp/src/feature/auth/presentation/viewmodel/auth_viewmodel.dart';

class AuthModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => AuthViewModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => AuthPage(),
        ),
      ];

  /* @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePage()),
      ]; */
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:newbankapp/src/feature/auth/auth_module.dart';
import 'package:newbankapp/src/feature/auth/presentation/view/page/screens/auth.dart';

import 'feature/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: AuthModule()),
      ];
}

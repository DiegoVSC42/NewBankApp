import 'package:flutter_modular/flutter_modular.dart';
import 'package:newbankapp/services/prefs_service.dart';
import 'package:newbankapp/src/feature/auth/auth_module.dart';
import 'package:newbankapp/src/feature/auth/presentation/view/page/screens/auth.dart';

import 'feature/home/home_module.dart';

class AppModule extends Module {
  bool firstTime;
  AppModule({
    required this.firstTime,
  });
  @override
  List<Bind> get binds => [];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: AuthModule(firstTime: firstTime)),
      ];
}

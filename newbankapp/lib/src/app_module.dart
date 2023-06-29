import 'package:flutter_modular/flutter_modular.dart';
import 'package:newbankapp/src/feature/auth/auth_module.dart';

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

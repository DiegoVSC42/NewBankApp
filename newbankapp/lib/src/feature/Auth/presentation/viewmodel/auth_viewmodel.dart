import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:newbankapp/src/feature/auth/presentation/view/page/screens/auth.dart';
import 'package:newbankapp/src/feature/onboarding/presentation/view/page/onboarding_screen.dart';

class AuthViewModel extends NotifierStore<Exception, int> {
  AuthViewModel() : super(0);
}

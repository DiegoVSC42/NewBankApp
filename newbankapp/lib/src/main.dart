import 'dart:io';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:newbankapp/src/store/user_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_module.dart';
import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool firstTime = await shouldShowOnboarding();

  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ModularApp(
      module: AppModule(firstTime: firstTime),
      child: const AppWidget(),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<bool> shouldShowOnboarding() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool firstTime = prefs.getBool('FIRST_TIME') ?? true;
  return firstTime;
}

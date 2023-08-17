import 'package:flutter/cupertino.dart';
import 'package:inventory_app/pages/auth/login/login.dart';
import 'package:inventory_app/pages/auth/register/register.dart';

import '../pages/estimation/estimation.dart';
import '../pages/home/home.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (_) => const HomePage(),
    'login': (_) => const LoginPage(),
    'register': (_) => const RegisterPage(),
    'estimation': (_) => const EstimationPage(),
  };
}

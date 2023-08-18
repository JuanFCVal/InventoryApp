import 'package:flutter/cupertino.dart';
import 'package:inventory_app/pages/auth/login/login.dart';
import 'package:inventory_app/pages/auth/register/register.dart';

import '../pages/estimation/estimation.dart';
import '../pages/history/history.dart';
import '../pages/home/home.dart';
import '../pages/stock_control/stock_control.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (_) => const HomePage(),
    'login': (_) => const LoginPage(),
    'register': (_) => const RegisterPage(),
    'estimation': (_) => EstimationPage(),
    'stock': (_) => const StockPage(),
    'history': (_) => const HistoryPage(),
  };
}

import 'package:flutter/material.dart';
import 'package:inventory_app/providers/sessionProvider.dart';
import 'package:inventory_app/routes/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SessionProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inventario',
        routes: getApplicationRoutes(),
        initialRoute: 'login',
      ),
    );
  }
}

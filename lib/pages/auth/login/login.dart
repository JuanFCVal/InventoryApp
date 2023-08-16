import 'package:flutter/material.dart';
import 'package:inventory_app/UI/textStyles.dart';
import 'package:inventory_app/pages/auth/login/widgets/loginForm.dart';

import 'widgets/background.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SizedBox(
        child: Stack(
          children: [
            const LoginBackground(),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    !keyboardIsOpen
                        ? Column(
                            children: [
                              Text(
                                "Bienvenido a ",
                                style: TextStyles.h1Style(
                                  color: Colors.white,
                                ),
                                maxLines: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "MEDSTOCK",
                                    style: TextStyles.h1Style(
                                      color: Colors.white,
                                    ),
                                    maxLines: 2,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Icon(
                                    Icons.monitor_heart,
                                    color: Colors.red,
                                    size: 32,
                                  ),
                                ],
                              ),
                            ],
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 30,
                    ),
                    LoginForm()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

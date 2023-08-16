import 'package:flutter/material.dart';
import 'package:inventory_app/UI/textStyles.dart';
import 'package:provider/provider.dart';

import '../../../../UI/buttonStyle.dart';
import '../../../../providers/sessionProvider.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key});
  bool showError = false;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _userController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final sessionProvider = Provider.of<SessionProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Ingrese sus credenciales para iniciar sesión",
            style: TextStyles.h3Style(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _userController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Ingrese el usuario");
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.person_2_outlined,
                      color: Colors.blue,
                    ),
                    labelText: "Correo electrónico",
                    hintText: "Ingrese su correo electrónico",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("Ingrese la contraseña");
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.key,
                      color: Colors.blue,
                    ),
                    labelText: "Contraseña",
                    hintText: "Ingrese su contraseña",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                widget.showError
                    ? const Text(
                        "Credenciales incorrectas",
                        style: TextStyle(color: Colors.red),
                      )
                    : const SizedBox(),
                sessionProvider.isLoading()
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        style: BttStyles.primary(),
                        onPressed: () async {
                          final isValid = await sessionProvider.validateLogin(
                              _userController.value.text,
                              _passwordController.value.text);
                          if (isValid) {
                            Navigator.popAndPushNamed(context, 'home');
                          } else {
                            widget.showError = true;
                            setState(() {});
                          }
                        },
                        child: const Text("Iniciar sesión")),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () => {},
                    style: BttStyles.text(),
                    child: const Text("No tienes cuenta? Registrate"))
              ],
            ),
          )
        ],
      ),
    );
  }
}

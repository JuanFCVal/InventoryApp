import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.5;
    const borderRadius = BorderRadius.vertical(bottom: Radius.circular(20));
    return Stack(
      children: [
        SizedBox(
          height: height,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Image.network(
              'https://www.elfarmaceutico.es/uploads/s1/42/29/8/b45ee44cb3181d1af1cd7c9bd2a7bf23.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: height,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(10, 30, 68, 0.8),
              borderRadius: borderRadius),
        ),
      ],
    );
  }
}

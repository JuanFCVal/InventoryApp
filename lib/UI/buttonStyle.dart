import 'package:flutter/material.dart';

class BttStyles {
  static ButtonStyle primary() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      backgroundColor:
          MaterialStateProperty.all(const Color.fromRGBO(10, 30, 68, 0.85)),
    );
  }

  static ButtonStyle succes() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
      backgroundColor: MaterialStateProperty.all(Colors.green),
    );
  }

  static ButtonStyle text() {
    return ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

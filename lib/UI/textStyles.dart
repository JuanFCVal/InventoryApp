import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle h1Style({Color? color}) {
    return TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black, // Usar negro si no se proporciona un color
    );
  }

  static TextStyle h3Style({Color? color, a}) {
    return TextStyle(
      fontSize: 20.0,
      color: color ?? Colors.black, // Usar negro si no se proporciona un color
    );
  }

  static TextStyle h5Style({Color? color, a}) {
    return TextStyle(
      fontSize: 16.0,
      color: color ?? Colors.black, // Usar negro si no se proporciona un color
    );
  }

  static TextStyle p({Color? color, a}) {
    return TextStyle(
      fontSize: 14.0,
      color: color ?? Colors.black, // Usar negro si no se proporciona un color
    );
  }
}

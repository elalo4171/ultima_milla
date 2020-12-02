import 'package:flutter/material.dart';

class SuperSimpleTheme {
  static const primaryColor = Color(0xFF54C8E2);
  static const secondaryColor = Color(0xFF74D1E6);

  ThemeData get principalTheme {
    return ThemeData(
      primaryColor: primaryColor,
      accentColor: secondaryColor,
      cursorColor: secondaryColor,
    );
  }
}

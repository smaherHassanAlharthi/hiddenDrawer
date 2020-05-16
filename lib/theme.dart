import 'package:flutter/material.dart';
ThemeData myThemeData = ThemeData(
  primaryColor:HexColor("2E8B57"),
  accentColor: Colors.lightGreen,
  primaryColorDark: Colors.green,
  splashColor: Colors.white,
  textTheme: TextTheme(
    subtitle: TextStyle(
      fontSize: 50,
      //color: Colors.white;
    ),
  ),
);
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}



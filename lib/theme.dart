import 'package:flutter/material.dart';

const montserrat = "Montserrat";

class AppTheme {
  static const whiteColor = Color(0xffffffff);
  static const lightGrey1Color = Color.fromARGB(255, 209, 209, 209);
  static const lightGrey2Color = Color.fromARGB(255, 134, 134, 134);
  static const lightGrey3Color = Color.fromARGB(255, 97, 97, 97);

  static const lightBlue1Color = Color.fromARGB(255, 106, 235, 222);

  static const blue1Color = Color.fromARGB(255, 2, 102, 209);
  static const darkBlue1Color = Color.fromARGB(255, 0, 82, 132);

  static const lightPink1Color = Color.fromARGB(255, 255, 130, 172);

  static const blackColor = Color(0xff000000);

  static ThemeData light() {
    return ThemeData(
        brightness: Brightness.light,
        fontFamily: montserrat,
        appBarTheme: const AppBarTheme(
          backgroundColor: lightBlue1Color,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: lightPink1Color));
  }
}

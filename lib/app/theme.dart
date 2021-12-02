import 'package:flutter/material.dart';
import 'package:flutter_bank_app/app/constants.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          backgroundColor: primaryRed,
          iconTheme: IconThemeData(color: Colors.white)));

  // final darkTheme = ThemeData.dark().copyWith(
  //     brightness: Brightness.dark,
  //     visualDensity: VisualDensity.adaptivePlatformDensity,
  //     appBarTheme: AppBarTheme(
  //         backgroundColor: Global.dark_default,
  //         foregroundColor: Global.white,
  //         iconTheme: IconThemeData(color: Global.white)));
}

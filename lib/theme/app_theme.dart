import 'package:labib/core/constant/colors_app.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      fontFamily: 'fontm',
      primaryColor: ColorsApp.premary,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          color: ColorsApp.black,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          color: ColorsApp.white,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          fontSize: 15,
          color: ColorsApp.black,
         
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: ColorsApp.black,
        ),
      ));
}

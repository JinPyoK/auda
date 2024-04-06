import 'package:auda/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final customTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme: GoogleFonts.hahmletTextTheme(),
  inputDecorationTheme: _inputDecoTheme,
  bottomNavigationBarTheme: _bottomNavTheme,
);

final _inputDecoTheme = InputDecorationTheme(
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: CustomColor.thirdColor, width: 2.5),
    borderRadius: BorderRadius.circular(12),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: CustomColor.mainColor, width: 2.5),
    borderRadius: BorderRadius.circular(12),
  ),
);

const _bottomNavTheme = BottomNavigationBarThemeData(
    selectedItemColor: CustomColor.mainColor,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ));

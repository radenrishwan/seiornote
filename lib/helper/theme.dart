import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seiornote/helper/color.dart';

ThemeData kThemeDefault = ThemeData.dark().copyWith(
  primaryColor: kPrimaryColor,
  textTheme: TextTheme(
    titleLarge: GoogleFonts.merriweather(),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: kPrimaryColor,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: kPrimaryColor,
  ),
  listTileTheme: ListTileThemeData(
    iconColor: kPrimaryColor,
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    foregroundColor: kTextColorDark,
  )),
);

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColor {
  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);
  static Color grey = const Color(0xFF939393);

  static Color primary = const Color(0xFF6C5CE7);
  static Color background = const Color(0xFF353535);

 
}

abstract class AppThemeStyle {
  static TextStyle poppinsLight(double size, Color? color,
      [FontWeight weight = FontWeight.w300]) {
    return GoogleFonts.poppins(
        color: color, fontSize: size, fontWeight: weight);
  }

  static TextStyle poppinsRegular(double size, Color? color,
      [FontWeight weight = FontWeight.w400]) {
    return GoogleFonts.poppins(
        color: color, fontSize: size, fontWeight: weight);
  }

  static TextStyle poppinsMedium(double size, Color? color,
      [FontWeight weight = FontWeight.w500]) {
    return GoogleFonts.poppins(
        color: color, fontSize: size, fontWeight: weight);
  }

  static TextStyle poppinsSemiBold(double size, Color? color,
      [FontWeight weight = FontWeight.w600]) {
    return GoogleFonts.poppins(
        color: color, fontSize: size, fontWeight: weight);
  }

  static TextStyle poppinsBold(double size, Color? color,
      [FontWeight weight = FontWeight.w700]) {
    return GoogleFonts.poppins(
        color: color, fontSize: size, fontWeight: weight);
  }

  static TextStyle poppinsExtraBold(double size, Color? color,
      [FontWeight weight = FontWeight.w800]) {
    return GoogleFonts.poppins(
        color: color, fontSize: size, fontWeight: weight);
  }

  static TextStyle poppinsBlack(double size, Color? color,
      [FontWeight weight = FontWeight.w900]) {
    return GoogleFonts.poppins(
        color: color, fontSize: size, fontWeight: weight);
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salt_code_test/core/ui_constants/app_colors.dart';

class AppFonts {
  AppFonts._();

  // Primary
  static TextStyle primaryRegularTextStyle = GoogleFonts.lato(
    color: AppTheme.primaryTextColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle primaryLightTextStyle = GoogleFonts.lato(
    color: AppTheme.primaryTextColor.withOpacity(0.6),
    fontWeight: FontWeight.w400,
  );

  static TextStyle primarySemiBoldTextStyle = GoogleFonts.lato(
    color: AppTheme.primaryTextColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle primaryBoldTextStyle = GoogleFonts.lato(
    color: AppTheme.primaryTextColor,
    fontWeight: FontWeight.w700,
  );

  // white
  static TextStyle whiteRegularTextStyle = GoogleFonts.lato(
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle whiteLightTextStyle = GoogleFonts.lato(
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  static TextStyle whiteSemiBoldTextStyle = GoogleFonts.lato(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle whiteBoldTextStyle = GoogleFonts.lato(
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  // indigo

}

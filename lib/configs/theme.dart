import 'package:flutter/material.dart';
import 'package:flutter_covid/configs/color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final brownTeme = ThemeData(
  backgroundColor: background,
  primaryColor: Color(0xFFe29578),
  shadowColor: Color(0xFFffddd2),
  dividerColor: Color(0xFF83c5be),
  disabledColor: Color(0xffBDBDBD),
  accentColor: Color(0xFFFFFFFF),
  focusColor: Color(0xFF66BB64),
  errorColor: Color(0xFFEF5350),
  hintColor: Color(0xffE0E0E0),
  unselectedWidgetColor: Color(0xFFFFA726),
  primaryColorLight: Color(0xFF29B6F6),
  primaryColorDark: Color(0xFFEC407A),
  secondaryHeaderColor: Color(0xFF42A5F5),
  dialogBackgroundColor: Color(0xFFFF7043),
  splashColor: Color(0xFFffddd2),
  textTheme: TextTheme(
    headline1: GoogleFonts.sarabun(
      fontWeight: FontWeight.bold,
      fontSize: 27.sp,
      color: Color(0xFFFFFFFF),
    ),
    subtitle1: GoogleFonts.sarabun(
      fontSize: 22.sp,
      color: Color(0xffE0E0E0),
    ),
    headline2: GoogleFonts.sarabun(
      color: Color(0xFF006d77),
      fontSize: 27.sp,
    ),
    subtitle2: GoogleFonts.sarabun(
      color: Color(0xFF006d77).withOpacity(0.5),
      fontSize: 17.sp,
    ),
    headline3: GoogleFonts.sarabun(
      fontSize: 32.sp,
      color: Color(0xFF42A5F5),
    ),
    headline4: GoogleFonts.sarabun(
      fontSize: 28.sp,
    ),
    bodyText1: GoogleFonts.sarabun(
      fontSize: 18.sp,
      color: Color(0xffBDBDBD),
    ),
    bodyText2: GoogleFonts.sarabun(
      fontSize: 20.sp,
      color: Color(0xFF006d77),
    ),
  ),
);

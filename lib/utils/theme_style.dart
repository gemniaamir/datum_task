import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeStyle {
  final BuildContext context;

  static late Color? iconColor;
  static late TextStyle? editFieldStyle;
  static late TextStyle? hintStyle;
  static late TextStyle? labelStyle;
  static late TextStyle? normalText;
  static late TextStyle? mediumText;
  static late TextStyle? largeText;
  static late TextStyle? normalTextWH;
  static late TextStyle? mediumTextWH;
  static late TextStyle? largeTextWH;

  static late Color primaryColor;
  static late Color accentColor;
  static late Color secondryColor;
  static late Color errorColor;
  static late Color textColor;
  static late Color barColor;

  ThemeStyle(this.context) {
    loadStyle();
    log('Theme Style get loaded ===>');
  }

  loadStyle() {
    iconColor = Theme.of(context).iconTheme.color;
    accentColor = const Color(0xFFAAAAAA);
    primaryColor = const Color(0xFF314A59);
    secondryColor = const Color(0xFFFFFFFF);
    errorColor = const Color(0xFFB00020);
    textColor = const Color(0xFF181D2D);
    barColor = const Color(0xFFFFFFFF);

    editFieldStyle = Theme.of(context).textTheme.titleSmall;
    labelStyle = GoogleFonts.roboto(color: textColor, fontSize: 14);
    hintStyle = GoogleFonts.roboto(color: Colors.grey[400], fontSize: 14);
    normalText = GoogleFonts.poppins(color: textColor);
    normalTextWH = GoogleFonts.poppins(color: Colors.white);
    mediumText = GoogleFonts.poppins(color: textColor, fontSize: 16);
    mediumTextWH = GoogleFonts.poppins(color: Colors.white, fontSize: 16);
    largeText = GoogleFonts.poppins(color: textColor, fontSize: 20);
    largeTextWH = GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 20,
    );
  }
}

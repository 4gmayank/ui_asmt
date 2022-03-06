import 'dart:ui';

import 'package:zip_loan/core/utils/color_utils.dart';

class FontStyles {
  static const String FONT_HEADLINE = "roboto";

  TextStyle normalStyle(
      {double letterSpacing = 0,
      double height= 1,
      double fontSize = 12.0,
      Color fontColor = ColorUtils.textColor,
      FontStyle fontStyle = FontStyle.normal,
      String fontFamily = FontStyles.FONT_HEADLINE,
      FontWeight fontWeight = FontWeight.w400,
      bool isUnderline = false}) {
    return normalFontStyle(
      letterSpacing: letterSpacing,
      height: height,
      fontSize: fontSize,
      fontColor: fontColor,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle normalFontStyle(
      {double fontSize = 12.0,
      double height= 1,
      double letterSpacing = 0,
      Color fontColor = ColorUtils.textColor,
      FontWeight fontWeight = FontWeight.normal,
      FontStyle fontStyle = FontStyle.normal,
      String fontFamily = FontStyles.FONT_HEADLINE,
      TextDecoration decoration = TextDecoration.none}) {
    return TextStyle(
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      color: fontColor,
      fontStyle: fontStyle,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }
  static TextStyle t(){
    return TextStyle(
        color: ColorUtils.textColor,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
        fontSize: 20);
  }
}

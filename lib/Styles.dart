
import 'package:flutter/material.dart';
import 'package:test_home/Config.dart';

class Styles {

  ///title
  static TextStyle titleStyle = TextStyle(
      fontSize: Config.textLargeSize, color: Config.titleColor,
  ),
    titlePrimaryStyle = TextStyle(
      fontSize: Config.textLargeSize, color: Config.textColorOnPrimary,
    ),
    titleTextColorBoldStyle = TextStyle(
      fontSize: Config.textLargeSize, color: Config.textColor,
      fontWeight: FontWeight.bold,
    ),
    titleBoldStyle = TextStyle(
      fontSize: Config.textLargeSize, color: Config.titleColor,
      fontWeight: FontWeight.bold,
    );

  ///text
  static TextStyle textStyle = TextStyle(
    fontSize: Config.textMediumSize, color: Config.textColor,
  ),
    textPrimaryStyle = TextStyle(
      fontSize: Config.textMediumSize, color: Config.textColorOnPrimary,
    ),
    textTileColorStyle = TextStyle(
      fontSize: Config.textMediumSize, color: Config.titleColor,
    ),
    textTileColorSmallStyle = TextStyle(
      fontSize: Config.textSmallSize, color: Config.titleColor,
    ),
    textDescriptionStyle = TextStyle(
      fontSize: Config.textMediumSize, color: Config.titleColor, height: 1.5,
    );
}

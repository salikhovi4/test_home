
import 'package:flutter/material.dart';

class Config {

  ///Main style
  static const primaryColor = Color.fromRGBO(116, 109, 247, 1),
    primaryDarkColor = Color.fromRGBO(70, 61, 245, 1),
    primaryLightColor = Color.fromRGBO(163, 158, 250, 1);

  static Color shadowColor = Colors.black;

  ///Global components
  ///Text
  static Color textColorOnPrimary = Colors.white;
  static const Color textColor = Color.fromRGBO(136, 136, 136, 1),
    titleColor = Color.fromRGBO(0, 0, 0, 1);
  static double textLargeSize = 19, textMediumSize = 14, textSmallSize = 10;

  ///Durations
  static int animDuration = 250, progressDuration = 500;

  ///Activity
  static const Color activityBackColor = Color.fromRGBO(248, 248, 248, 1),
    activityHintColor = Color.fromRGBO(237, 237, 237, 1);
  static double activityBorderRadius = 16, padding = 16, maxBorder = 1000;

  ///Api address
  static String getHomesInfo = 'https://elki.rent/test/house.json';

  ///Request timeout
  static int sendTimeout = 35000;
  static int receiveTimeout = 25000;

  ///Geometric sizes
  static double iconSize = 40,
    imageHeight = 264,
    dotSize = 10;
}
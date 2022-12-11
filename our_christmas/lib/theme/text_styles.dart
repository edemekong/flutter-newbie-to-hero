import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyle {
  static const double headline1Size = 61;
  static const double headline2Size = 35;
  static const double headline3Size = 30;
  static const double headline4Size = 24;
  static const double headline5Size = 20;
  static const double headline6Size = 17;
  static const double subtile1Size = 18;
  static const double subtile2Size = 16;
  static const double body1Size = 14;
  static const double body2Size = 13.5;
  static const double buttonSize = 14;
  static const double caption = 12;
  static const double overline = 10;

  static const TextTheme mobileTextThemeLight = TextTheme(
    headline1: TextStyle(
      fontFamily: "My Happy Ending",
      fontSize: headline1Size,
      color: AppColors.black,
      height: 1.5,
      fontWeight: FontWeight.w400,
    ),
    headline2: TextStyle(
      fontFamily: "Open Sans",
      fontSize: headline2Size,
      color: AppColors.black,
      fontWeight: FontWeight.w600,
    ),
    headline3: TextStyle(
      fontFamily: "Open Sans",
      fontSize: headline3Size,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
    ),
    headline4: TextStyle(
      fontFamily: "Open Sans",
      fontSize: headline4Size,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    ),
    headline5: TextStyle(
      fontFamily: "Open Sans",
      fontSize: headline5Size,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
    ),
    headline6: TextStyle(
      fontFamily: "Open Sans",
      fontSize: headline6Size,
      color: AppColors.black,
      fontWeight: FontWeight.w600,
    ),
    subtitle1: TextStyle(
      fontFamily: "Open Sans",
      fontSize: subtile1Size,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    ),
    subtitle2: TextStyle(
      fontFamily: "Open Sans",
      fontSize: subtile2Size,
      color: AppColors.black,
      fontWeight: FontWeight.w700,
    ),
    bodyText1: TextStyle(
      fontFamily: "Open Sans",
      fontSize: body1Size,
      color: AppColors.grey,
      fontWeight: FontWeight.w400,
    ),
    bodyText2: TextStyle(
      fontFamily: "Open Sans",
      fontSize: body2Size,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    ),
    button: TextStyle(
      fontFamily: "Open Sans",
      fontSize: buttonSize,
      color: AppColors.white,
      fontWeight: FontWeight.w600,
    ),
    caption: TextStyle(
      fontFamily: "Open Sans",
      fontSize: caption,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    ),
    overline: TextStyle(
      fontFamily: "Open Sans",
      fontSize: overline,
      color: AppColors.black,
      height: 0,
      fontWeight: FontWeight.w400,
    ),
  );

  static const TextTheme mobileTextThemeDark = TextTheme(
    headline1: TextStyle(
      fontFamily: "My Happy Ending",
      fontSize: headline1Size,
      color: AppColors.white,
      height: 0,
      fontWeight: FontWeight.w400,
    ),
    headline2: TextStyle(
      fontFamily: "Open Sans",
      fontSize: headline2Size,
      color: AppColors.white,
      fontWeight: FontWeight.w600,
    ),
    headline3: TextStyle(
      fontFamily: "Open Sans",
      fontSize: headline3Size,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
    ),
    headline4: TextStyle(
      fontFamily: "Open Sans",
      fontSize: headline4Size,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
    ),
    headline5: TextStyle(
      fontFamily: "Open Sans",
      fontSize: headline5Size,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
    ),
    headline6: TextStyle(
      fontFamily: "Open Sans",
      fontSize: headline6Size,
      color: AppColors.lightGrey,
      fontWeight: FontWeight.w600,
    ),
    subtitle1: TextStyle(
      fontFamily: "Open Sans",
      fontSize: subtile1Size,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
    ),
    subtitle2: TextStyle(
      fontFamily: "Open Sans",
      fontSize: subtile2Size,
      color: AppColors.lightGrey,
      fontWeight: FontWeight.w700,
    ),
    bodyText1: TextStyle(
      fontFamily: "Open Sans",
      fontSize: body1Size,
      color: AppColors.mediumGrey,
      height: 1.35,
      fontWeight: FontWeight.w400,
    ),
    bodyText2: TextStyle(
      fontFamily: "Open Sans",
      fontSize: body2Size,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
    ),
    button: TextStyle(
      fontFamily: "Open Sans",
      fontSize: buttonSize,
      color: AppColors.white,
      fontWeight: FontWeight.w600,
    ),
    caption: TextStyle(
      fontFamily: "Open Sans",
      fontSize: caption,
      color: AppColors.lightGrey,
      fontWeight: FontWeight.w400,
    ),
    overline: TextStyle(
      fontFamily: "Open Sans",
      fontSize: overline,
      color: AppColors.lightGrey,
      height: 0,
      fontWeight: FontWeight.w400,
    ),
  );
}

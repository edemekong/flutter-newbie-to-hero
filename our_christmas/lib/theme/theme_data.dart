import 'package:flutter/material.dart';
import '/theme/text_styles.dart';
import 'colors.dart';

class AppThemeData {
  static ThemeData themeLight = ThemeData(
    fontFamily: "Open Sans",
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBarColorLight,
      foregroundColor: AppColors.appBarColorLight,
      iconTheme: IconThemeData(
        color: AppColors.defaultIconColorLight,
        size: 24,
      ),
      toolbarHeight: kToolbarHeight + 4,
    ),
    primaryColorDark: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor,
    dividerTheme: const DividerThemeData(
      color: AppColors.mediumGrey,
      thickness: 1.5,
    ),
    backgroundColor: AppColors.backgroundColorLight,
    cardColor: AppColors.cardColorLight,
    canvasColor: AppColors.card2ColorLight,
    scaffoldBackgroundColor: AppColors.backgroundColorLight,
    primaryColor: AppColors.primaryColor,
    buttonTheme: const ButtonThemeData(
      height: 47,
      splashColor: AppColors.splashColorLight,
    ),
    hintColor: AppColors.hintTextColorLight,
    indicatorColor: AppColors.indicatorColorLight,
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(AppColors.mediumGrey),
      splashRadius: 16,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.defaultIconColorLight,
      size: 24,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.appBarColorLight,
      elevation: 0,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.selectedColorLight,
      unselectedItemColor: AppColors.unselectedColorLight,
      selectedIconTheme: IconThemeData(
        color: AppColors.selectedColorLight,
        size: 29,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.unselectedColorLight,
        size: 29,
      ),
    ),
    splashColor: AppColors.splashColorLight,
    primaryIconTheme: const IconThemeData(
      color: AppColors.defaultIconColorLight,
      size: 24,
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: AppTextStyle.mobileTextThemeLight.subtitle1,
      labelColor: AppColors.black,
      unselectedLabelColor: AppColors.grey,
      unselectedLabelStyle: AppTextStyle.mobileTextThemeLight.subtitle1,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    unselectedWidgetColor: AppColors.unselectedColorLight,
    textTheme: AppTextStyle.mobileTextThemeLight,
    primaryTextTheme: AppTextStyle.mobileTextThemeLight,
    errorColor: AppColors.red,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColors.secondaryColor),
  );
}

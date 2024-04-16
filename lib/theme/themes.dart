import 'package:company_inventory/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class Themes {
  static const lightId = 'daily_notes_light';
  static const darkId = 'daily_notes_dark';

  static AppTheme get light {
    final themeLight = ThemeData.light();
    return AppTheme(
      id: lightId,
      description: 'Default theme',
      data: themeLight.copyWith(
        primaryColor: ThemeColors.primary,
        cardColor: ThemeColors.darkBackground,
        scaffoldBackgroundColor: ThemeColors.lightBackground,
        appBarTheme: themeLight.appBarTheme.copyWith(
          elevation: 0,
          color: ThemeColors.lightBackground,
          actionsIconTheme: themeLight.appBarTheme.actionsIconTheme?.copyWith(
            color: ThemeColors.black,
          ),
          iconTheme: themeLight.appBarTheme.iconTheme?.copyWith(
            color: ThemeColors.black,
          ),
          titleTextStyle: themeLight.textTheme.headline3?.copyWith(
            color: ThemeColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.1,
          ),
        ),
        floatingActionButtonTheme:
            themeLight.floatingActionButtonTheme.copyWith(
          backgroundColor: ThemeColors.darkBackground,
        ),
        textTheme: TextTheme(
          bodyText1: themeLight.textTheme.bodyText1?.copyWith(
            color: ThemeColors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            height: 1.1,
          ),
          bodyText2: themeLight.textTheme.bodyText2?.copyWith(
            color: ThemeColors.black,
            fontWeight: FontWeight.normal,
            fontSize: 14,
            height: 1.1,
          ),
          headline3: themeLight.textTheme.headline3?.copyWith(
            color: ThemeColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
          headline4: themeLight.textTheme.headline4?.copyWith(
            color: ThemeColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
          headline5: themeLight.textTheme.headline5?.copyWith(
            fontSize: 16,
            color: ThemeColors.black,
            fontWeight: FontWeight.w500,
            height: 1.3,
          ),
          headline6: themeLight.textTheme.headline6?.copyWith(
            color: ThemeColors.black,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            height: 1.4,
          ),
          subtitle1: themeLight.textTheme.subtitle1?.copyWith(
            fontSize: 16,
            color: ThemeColors.black,
            fontWeight: FontWeight.normal,
            height: 1.1,
          ),
          subtitle2: themeLight.textTheme.subtitle2?.copyWith(
            fontSize: 14,
            color: Colors.grey,
            letterSpacing: 0.1,
            fontWeight: FontWeight.normal,
            height: 1.1,
          ),
          button: themeLight.textTheme.button?.copyWith(
            color: ThemeColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            height: 1.1,
          ),
        ),
      ),
    );
  }

  static AppTheme get dark {
    final themeDark = ThemeData.dark();
    return AppTheme(
      id: darkId,
      description: 'Default dark theme',
      data: themeDark.copyWith(
        primaryColor: ThemeColors.primaryDarker,
        cardColor: ThemeColors.black,
        scaffoldBackgroundColor: ThemeColors.darkBackground,
        floatingActionButtonTheme: themeDark.floatingActionButtonTheme.copyWith(
          backgroundColor: ThemeColors.lightBackground,
        ),
        appBarTheme: themeDark.appBarTheme.copyWith(
          elevation: 0,
          color: ThemeColors.darkBackground,
        ),
        iconTheme: themeDark.iconTheme.copyWith(
          color: ThemeColors.black,
        ),
      ),
    );
  }
}

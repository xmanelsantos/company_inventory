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
          titleTextStyle: themeLight.textTheme.displaySmall?.copyWith(
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
          bodyLarge: themeLight.textTheme.bodyLarge?.copyWith(
            color: ThemeColors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            height: 1.1,
          ),
          bodyMedium: themeLight.textTheme.bodyMedium?.copyWith(
            color: ThemeColors.black,
            fontWeight: FontWeight.normal,
            fontSize: 14,
            height: 1.1,
          ),
          displaySmall: themeLight.textTheme.displaySmall?.copyWith(
            color: ThemeColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
          headlineMedium: themeLight.textTheme.headlineMedium?.copyWith(
            color: ThemeColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.1,
          ),
          headlineSmall: themeLight.textTheme.headlineSmall?.copyWith(
            fontSize: 16,
            color: ThemeColors.black,
            fontWeight: FontWeight.w500,
            height: 1.3,
          ),
          titleLarge: themeLight.textTheme.titleLarge?.copyWith(
            color: ThemeColors.black,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            height: 1.4,
          ),
          titleMedium: themeLight.textTheme.titleMedium?.copyWith(
            fontSize: 16,
            color: ThemeColors.black,
            fontWeight: FontWeight.normal,
            height: 1.1,
          ),
          titleSmall: themeLight.textTheme.titleSmall?.copyWith(
            fontSize: 14,
            color: Colors.grey,
            letterSpacing: 0.1,
            fontWeight: FontWeight.normal,
            height: 1.1,
          ),
          labelLarge: themeLight.textTheme.labelLarge?.copyWith(
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

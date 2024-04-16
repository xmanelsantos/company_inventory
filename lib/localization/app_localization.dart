import 'package:company_inventory/localization/localization_en.dart';
import 'package:company_inventory/localization/localization_pt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) {
    return Localizations.of(context, AppLocalization);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': LocalizationEN.values,
    'pt': LocalizationPT.values,
  };

  static final Locales locales = Locales();

  String get appName => _localizedValues[locale.languageCode]!['app_name']!;

  String get counter => _localizedValues[locale.languageCode]!['counter']!;

  String get increment => _localizedValues[locale.languageCode]!['increment']!;

  String get theme => _localizedValues[locale.languageCode]!['theme']!;

  String get light => _localizedValues[locale.languageCode]!['light']!;

  String get dark => _localizedValues[locale.languageCode]!['dark']!;

  String get welcome => _localizedValues[locale.languageCode]!['welcome']!;

  String get goodMorning =>
      _localizedValues[locale.languageCode]!['good_morning']!;

  String get goodAfternoon =>
      _localizedValues[locale.languageCode]!['good_afternoon']!;

  String get goodEvening =>
      _localizedValues[locale.languageCode]!['good_evening']!;
}

class Locales {
  String get en => 'en';

  String get pt => 'pt';

  List<Locale> get supportedLocales => [
        AppLocalization.locales.getLocale(en),
        AppLocalization.locales.getLocale(pt),
      ];

  Locale getLocale(String? languageCode) {
    switch (languageCode) {
      case 'pt':
        return const Locale('pt', 'BR');
      default:
        return const Locale('en', '');
    }
  }

  bool isLocaleSupported(String? languageCode) {
    final supportedLocales = AppLocalization.locales.supportedLocales.where(
      (locale) => locale.countryCode == languageCode,
    );
    return supportedLocales.isNotEmpty;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'pt',
      ].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture<AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

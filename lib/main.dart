
import 'package:company_inventory/localization/app_localization.dart';
import 'package:company_inventory/routes.dart';
import 'package:company_inventory/screens/home/home_screen.dart';
import 'package:company_inventory/stores/home/home_store.dart';
import 'package:company_inventory/theme/themes.dart';
import 'package:company_inventory/utils/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Routes.createRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageCode = DeviceUtils.defaultLocaleDevice?.languageCode ?? 'en';
    return ThemeProvider(
      onInitCallback: (controller, previouslySavedThemeFuture) async {
        final savedTheme = await previouslySavedThemeFuture;
        if (savedTheme != null) {
          controller.setTheme(savedTheme);
        } else {
          controller.setTheme(Themes.lightId);
          controller.forgetSavedTheme();
        }
      },
      themes: <AppTheme>[
        Themes.light,
        Themes.dark,
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeCtx) {
            return MultiProvider(
              providers: [
                Provider<HomeStore>(create: (_) => HomeStore()),
              ],
              child: MaterialApp(
                onGenerateTitle: (ctx) => AppLocalization.of(ctx).appName,
                locale: AppLocalization.locales.getLocale(languageCode),
                localizationsDelegates: const [
                  AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: AppLocalization.locales.supportedLocales,
                theme: ThemeProvider.themeOf(themeCtx).data,
                debugShowCheckedModeBanner: false,
                initialRoute: HomeScreen.routeName,
                navigatorKey: Routes.seafarer.navigatorKey,
                onGenerateRoute: Routes.seafarer.generator(),
              ),
            );
          },
        ),
      ),
    );
  }
}

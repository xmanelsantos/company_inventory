import 'package:company_inventory/localization/app_localization.dart';
import 'package:company_inventory/stores/home/home_store.dart';
import 'package:company_inventory/theme/theme_colors.dart';
import 'package:company_inventory/theme/theme_dimensions.dart';
import 'package:company_inventory/theme/themes.dart';
import 'package:company_inventory/utils/mixins/after_init_state.dart';
import 'package:company_inventory/utils/string_utils.dart';
import 'package:company_inventory/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AfterInitMixin {
  late AppLocalization _appLocalization;
  late ThemeData _theme;
  late HomeStore _homeStore;

  @override
  void afterInitState() {
    _theme = Theme.of(context);
    _appLocalization = AppLocalization.of(context);
    _homeStore = Provider.of<HomeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildWelcomeCard(),
          _buildThemeSelector(),
          _buildCounterDisplay(),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        elevation: 0,
        onPressed: () {
          _homeStore.increment();
        },
        child: const Icon(Icons.plus_one),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildWelcomeCard() {
    return CustomCard(
      color: ThemeColors.primaryClearer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${_appLocalization.welcome},',
                style: _theme.textTheme.headline3?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: _theme.cardColor,
                ),
              ),
              Text(
                '${getWelcomeMessage()}!',
                style: _theme.textTheme.headline6,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(ThemeDimensions.spacingRegular),
            decoration: BoxDecoration(
              border: Border.all(),
              color: ThemeColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.person),
          )
        ],
      ),
    );
  }

  String getWelcomeMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return _appLocalization.goodMorning;
    } else if (hour < 18) {
      return _appLocalization.goodAfternoon;
    } else {
      return _appLocalization.goodEvening;
    }
  }

  Widget _buildThemeSelector() {
    final currentTheme = ThemeProvider.themeOf(context).id == Themes.lightId
        ? Themes.lightId
        : Themes.darkId;

    final isLight = currentTheme == Themes.lightId;
    return CustomCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _appLocalization.theme,
            style: _theme.textTheme.headline4?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            isLight ? _appLocalization.light : _appLocalization.dark,
            style: _theme.textTheme.headline4?.copyWith(),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ThemeColors.gray),
            ),
            child: Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: isLight
                        ? ThemeColors.darkBackground
                        : ThemeColors.lightBackground,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.light_mode,
                      color: isLight
                          ? ThemeColors.lightBackground
                          : ThemeColors.darkBackground,
                    ),
                    onPressed: () {
                      setState(() {
                        ThemeProvider.controllerOf(context)
                            .setTheme(Themes.lightId);
                      });
                      ThemeProvider.controllerOf(context).saveThemeToDisk();
                    },
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: isLight
                        ? ThemeColors.lightBackground
                        : ThemeColors.darkBackground,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.dark_mode,
                      color: isLight
                          ? ThemeColors.darkBackground
                          : ThemeColors.lightBackground,
                    ),
                    onPressed: () {
                      setState(() {
                        ThemeProvider.controllerOf(context)
                            .setTheme(Themes.darkId);
                      });
                      ThemeProvider.controllerOf(context).saveThemeToDisk();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCounterDisplay() {
    return CustomCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _appLocalization.counter,
            style: _theme.textTheme.headline4?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Observer(
            builder: (_) {
              return Text(
                _homeStore.counter.toString(),
                style: _theme.textTheme.headline4?.copyWith(),
              );
            },
          ),
          TextButton(
            onPressed: () {
              _homeStore.increment();
            },
            child: Text(
              _appLocalization.increment,
              style: _theme.textTheme.headline4?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        StringUtils.formatAppName(_appLocalization.appName),
      ),
    );
  }
}

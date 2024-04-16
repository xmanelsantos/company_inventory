import 'package:company_inventory/screens/home/home_screen.dart';
import 'package:seafarer/seafarer.dart';

class Routes {
  static final seafarer = Seafarer();

  static void createRoutes() {
    seafarer.addRoutes([
      ..._homeRoutes,
    ]);
  }

  static List<SeafarerRoute> get _homeRoutes {
    return [
      SeafarerRoute(
          name: HomeScreen.routeName,
          builder: (_, __, ___) {
            return const HomeScreen();
          })
    ];
  }
}

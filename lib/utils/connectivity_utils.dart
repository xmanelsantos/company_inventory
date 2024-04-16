import 'package:connectivity/connectivity.dart';

class ConnectivityUtils {
  static Future<bool> get hasInternet async {
    return (await hasWifi) || (await hasMobileData);
  }

  static Future<bool> get hasWifi async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.wifi;
  }

  static Future<bool> get hasMobileData async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile;
  }
}
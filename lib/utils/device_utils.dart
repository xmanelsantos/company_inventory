import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

class DeviceUtils {
    static bool get isAndroid {
      return Platform.isAndroid;
    }
  
    static bool get isIOS {
      return Platform.isIOS;
    }
  
    static bool get isDebug {
      return !kReleaseMode;
    }
  
    static bool get isTablet {
      return Device.get().isTablet;
    }

    static void hideKeyboard(BuildContext context) {
        FocusScope.of(context).unfocus();
    }

    static Locale? get defaultLocaleDevice {
        return WidgetsBinding.instance.window.locale;
    }
}  
import 'package:company_inventory/theme/theme_colors.dart';
import 'package:company_inventory/theme/theme_dimensions.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  ///
  /// Shows infinite loading dialog blocking actions
  ///
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            insetPadding: const EdgeInsets.symmetric(
              horizontal: ThemeDimensions.spacingLarge,
              vertical: ThemeDimensions.spacingRegular,
            ),
            elevation: 24,
            content: const SizedBox(
              height: 40,
              width: 40,
              child: Align(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    ThemeColors.primary,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  /// 
  /// Use to close when a finished loading dialog completes
  ///
  static void dismissLoadingDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}
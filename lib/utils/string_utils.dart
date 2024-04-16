class StringUtils {
  static bool isValidEmail(String email) {
    final RegExp regex = RegExp(
      r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$",
    );
    return regex.hasMatch(email);
  }

  static bool isNullOrEmpty(String? str) {
    return str == null ||
        str.trim().isEmpty ||
        str.trim().toLowerCase() == 'null';
  }

  static bool isNotNullOrEmpty(String? str) {
    return str != null &&
        str.trim().isNotEmpty &&
        str.trim().toLowerCase() != 'null';
  }

  static String capitalize(String str) {
    return str[0].toUpperCase() + str.replaceFirst(str[0], '');
  }

  static String formatAppName(String str, {bool capitalize = true}) {
    if (capitalize) str = StringUtils.capitalize(str);
    return str.replaceAll('_', ' ');
  }
}

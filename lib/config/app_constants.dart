import 'dart:ui';

class AppConstants {
  static final String localizationAssetPath = "localization/";
  static final String localizationTurkishAssetPath = "localization/tr.json";
  static final String localizationEnglishAssetPath = "localization/en.json";

  static final List<Locale> supportedLocales = [
    const Locale('en', ''), // English
    const Locale('tr', ''), // Turkish
  ];

  static final String encryptionProviderKey = "Y0FlYCd1KXozTjdmSCx6Xw==";
  static final String appTitle = "JOURNEY"; // SharedPref kullan ?
}

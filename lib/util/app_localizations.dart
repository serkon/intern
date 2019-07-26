import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appName': 'appName',
      'appNameShort': 'appNameShort',
      'title': 'title',
      'desc': 'desc',
    },
    'tr': {
      'appName': 'appNametr',
      'appNameShort': 'appNameShorttr',
      'title': 'titletr',
      'desc': 'desctr',
    },
  };

  String get appName {
    return _localizedValues[locale.languageCode]['appName'];
  }

  String get appNameShort {
    return _localizedValues[locale.languageCode]['appNameShort'];
  }

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }

  String get desc {
    return _localizedValues[locale.languageCode]['desc'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'tr'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
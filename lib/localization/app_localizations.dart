import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class AppLocalizations {
  final Locale locale;
  static Map<String, String>? _localizedStrings;

  AppLocalizations(this.locale);

  static Future<AppLocalizations> load(Locale locale) async {
    await initializeDateFormatting();

    return AppLocalizations(locale);
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String translate(String key) {
    return _localizedStrings![key] ?? key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ru', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

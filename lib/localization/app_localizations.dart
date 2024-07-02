import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static Future<AppLocalizations> load(Locale locale) async {
    await initializeDateFormatting();

    return AppLocalizations(locale);
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String get russian {
    return Intl.message(
      'Russian',
      name: 'russian',
      desc: 'Russian language option',
      locale: locale.toString(),
    );
  }

  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: 'English language option',
      locale: locale.toString(),
    );
  }

  String get spanish {
    return Intl.message(
      'Spanish',
      name: 'spanish',
      desc: 'Spanish language option',
      locale: locale.toString(),
    );
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

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocaleUtils {
  Locale? locale;
  static Map<dynamic, dynamic>? _localisedValues;

  LocaleUtils(Locale this.locale);

  static LocaleUtils? of(BuildContext context) {
    return Localizations.of<LocaleUtils>(context, LocaleUtils);
  }

  static Future<LocaleUtils> load(Locale locale) async {
    LocaleUtils appTranslations = LocaleUtils(locale);
    String jsonContent =
        await rootBundle.loadString("assets/lang/${locale.languageCode}.json");
    _localisedValues = json.decode(jsonContent);
    return appTranslations;
  }

  get currentLanguage => locale!.languageCode;

  static String getString(BuildContext mContext, String key) {
    return _localisedValues![key] ?? "$key not found";
  }
}

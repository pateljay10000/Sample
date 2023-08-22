import 'dart:async';

import 'package:flutter/material.dart';

import 'Application.dart';
import 'LocaleUtils.dart';

class LocaleDelegate extends LocalizationsDelegate<LocaleUtils> {
  final Locale? newLocale;

  const LocaleDelegate({this.newLocale});

  @override
  bool isSupported(Locale locale) {
    return application.supportedLanguagesCodes.contains(locale.languageCode);
  }

  @override
  Future<LocaleUtils> load(Locale locale) {
    return LocaleUtils.load(newLocale ?? locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocaleUtils> old) {
    return true;
  }
}

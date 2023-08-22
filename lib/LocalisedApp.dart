import 'package:flutter/material.dart';
import 'package:sample/MyHomePage.dart';
import 'package:sample/localization/Application.dart';
import 'package:sample/styles/theme.dart';

import 'localization/LocaleDelegate.dart';

class LocalisedApp extends StatefulWidget {
  @override
  LocalisedAppState createState() {
    return LocalisedAppState();
  }
}
class LocalisedAppState extends State<LocalisedApp> {
  LocaleDelegate? _newLocaleDelegate;
  String themedata = '';

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = const LocaleDelegate(newLocale: Locale("en"));
    application.onLocaleChanged = onLocaleChange;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        _newLocaleDelegate!,
      ],
      supportedLocales: const [
        Locale("en", ""),
        Locale('hi', ""),
      ],
      theme: appTheme,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = LocaleDelegate(newLocale: locale);
    });
  }
}
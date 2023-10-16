import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:UShealthcare/localization/language_constants.dart';

class MyLocalizations {
  MyLocalizations(this.locale);

  final Locale locale;

  static MyLocalizations of(BuildContext context) {
    return Localizations.of(context, MyLocalizations);
  }

  static const LocalizationsDelegate<MyLocalizations> delegate =
  AppLocalizationsDelegate();

  // static MyLocalizations of(BuildContext context) {
  //   return Localizations.of<MyLocalizations>(context, MyLocalizations)!;
  // }

  late Map<String, String> _localizedStrings;

  // Future<bool> load() async {
  //   /*String jsonString = await rootBundle.loadString('lib/lang/${locale.languageCode}.json');
  //
  //   Map<String, dynamic> jsonMap = json.decode(jsonString);
  //
  //   _localizedStrings = jsonMap.map((key, value) {
  //     return MapEntry(key, value.toString());
  //   });
  //
  //   if(_localizedStrings.length==0)
  //     {*/
  //
  //     String jsonString = await rootBundle.loadString('lib/lang/en.json');
  //     Map<String, dynamic> jsonMap = json.decode(jsonString);
  //     //print(jsonMap.toString());
  //     _localizedStrings = jsonMap.map((key, value) {
  //       return MapEntry(key, value.toString());
  //     });
  //       // }
  //
  //   return true;
  // }

  Future loadTranslateFile() async {
    String _langFile =
    await rootBundle.loadString('lib/lang/${locale.languageCode}.json');

    Map<String, dynamic> _json = jsonDecode(_langFile);
    _localizedStrings = _json.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslate(String key) {
    return _localizedStrings[key]!;
  }
}

String buildTranslate(BuildContext context, String key) =>
    MyLocalizations.of(context).getTranslate(key);

// String buildTranslate(String key) =>
//     MyLocalizations.of(navigatorKey.currentContext).getString(key);

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const MyLocalizationsDelegate();

  @override
  //bool isSupported(Locale locale) => ['en', 'es', 'hi'].contains(locale.languageCode);
  bool isSupported(Locale locale) => true;

  @override
  Future<MyLocalizations> load(Locale locale) async {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    //return SynchronousFuture<MyLocalizations>(MyLocalizations(locale));

    MyLocalizations localizations = new MyLocalizations(locale);
    await localizations.loadTranslateFile();
    return localizations;
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}
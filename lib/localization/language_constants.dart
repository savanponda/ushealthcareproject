import 'package:flutter/cupertino.dart';
import 'package:UShealthcare/localization/AppLocalizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  const AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<MyLocalizations> load(Locale locale) async {
    MyLocalizations appLocalizations = MyLocalizations(locale);
    await appLocalizations.loadTranslateFile();
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant AppLocalizationsDelegate old) => false;
}

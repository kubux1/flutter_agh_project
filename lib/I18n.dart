import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'Locale/messages_all.dart';
import 'package:intl/intl.dart';

class AdvisorLocalizationsDelegate extends LocalizationsDelegate<AdvisorLocalizations> {
  const AdvisorLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pl'].contains(locale.languageCode);

  @override
  Future<AdvisorLocalizations> load(Locale locale) => AdvisorLocalizations.load(locale);

  @override
  bool shouldReload(AdvisorLocalizationsDelegate old) => false;
}

class AdvisorLocalizations {
  AdvisorLocalizations(this.localeName);

  static Future<AdvisorLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      return AdvisorLocalizations(localeName);
    });
  }

  static AdvisorLocalizations of(BuildContext context) {
    return Localizations.of<AdvisorLocalizations>(context, AdvisorLocalizations);
  }

  final String localeName;

//  ./l10.sh - help utility script for generating translation .arb files

  String get title {
    return Intl.message(
      'Location Advisor',
      name: 'title',
      desc: 'Title for the Demo application',
      locale: localeName,
    );
  }

  String get restaurants {
    return Intl.message(
      'Restaurants',
      name: 'restaurants',
      desc: 'Restaurants',
      locale: localeName,
    );
  }

  String get locationsSearchBarHintText {
    return Intl.message(
      'Name of cities, districts, places, etc…',
      name: 'locationsSearchBarHintText',
      desc: 'Name of cities, districts, places, etc…',
      locale: localeName,
    );
  }




}


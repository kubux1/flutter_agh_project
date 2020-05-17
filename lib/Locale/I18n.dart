import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

class AdvisorLocalizationsDelegate
    extends LocalizationsDelegate<AdvisorLocalizations> {
  const AdvisorLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pl'].contains(locale.languageCode);

  @override
  Future<AdvisorLocalizations> load(Locale locale) =>
      AdvisorLocalizations.load(locale);

  @override
  bool shouldReload(AdvisorLocalizationsDelegate old) => false;
}

class AdvisorLocalizations {
  AdvisorLocalizations(this.localeName);

  static Future<AdvisorLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      return AdvisorLocalizations(localeName);
    });
  }

  static AdvisorLocalizations of(BuildContext context) {
    return Localizations.of<AdvisorLocalizations>(
        context, AdvisorLocalizations);
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

  String get attractions {
    return Intl.message(
      'Attractions',
      name: 'attractions',
      desc: 'Attractions',
      locale: localeName,
    );
  }

  String get hotels {
    return Intl.message(
      'Hotels',
      name: 'hotels',
      desc: 'Hotels',
      locale: localeName,
    );
  }

  String get airports {
    return Intl.message(
      'Airports',
      name: 'airports',
      desc: 'airports',
      locale: localeName,
    );
  }

  String get searching {
    return Intl.message(
      'Searching...',
      name: 'searching',
      desc: 'searching',
      locale: localeName,
    );
  }

  String get noResultsFound {
    return Intl.message(
      'No results found',
      name: 'noResultsFound',
      desc: 'noresultsfound',
      locale: localeName,
    );
  }

  String get attractionName {
    return Intl.message(
      'Matthias Church',
      name: 'attractionName',
      locale: localeName,
    );
  }

  String get attractionDescription {
    return Intl.message(
      'Used over the centuries as a coronation church for the Hungarian kings, the slender and graceful architecture of this beautiful church dominates the main square of the Castle area.',
      name: 'attractionDescription',
      locale: localeName,
    );
  }

  String get currency {
    return Intl.message(
      'USD',
      name: 'currency',
      locale: localeName,
    );
  }

  String get locale_string {
    return Intl.message(
      'en_US',
      name: 'locale_string',
      locale: localeName,
    );
  }

  String errorOccurred(error) => Intl.message(
        'Error occurred : $error',
        name: 'errorOccurred',
        args: [error],
        desc: 'Print error message',
        locale: localeName,
      );

  String radius(rad) => Intl.message(
        'Radius $rad km',
        name: 'radius',
        args: [rad],
        desc: 'radius',
        locale: localeName,
      );

  String get rating {
    return Intl.message(
      'Rating: ',
      name: 'rating',
      desc: 'rating',
      locale: localeName,
    );
  }

  String get distance {
    return Intl.message(
      'Distance: ',
      name: 'distance',
      desc: 'distance',
      locale: localeName,
    );
  }
}

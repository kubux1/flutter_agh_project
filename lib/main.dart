import 'package:flutter/material.dart';
import 'package:touristadvisor/AttractionDetails.dart';
import 'LocationsSearchBar.dart';
import 'LocationsSearchBarFilter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'Localization/messages_all.dart';

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

  String get title {
    return Intl.message(
      'Location Advisor',
      name: 'title',
      desc: 'Title for the Demo application',
      locale: localeName,
    );
  }
}

class AdvisorLocalizationsDelegate extends LocalizationsDelegate<AdvisorLocalizations> {
  const AdvisorLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pl'].contains(locale.languageCode);

  @override
  Future<AdvisorLocalizations> load(Locale locale) => AdvisorLocalizations.load(locale);

  @override
  bool shouldReload(AdvisorLocalizationsDelegate old) => false;
}

class DefaultTabControllerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // The number of tabs / content sections we need to display
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.filter_list))
            ]),
            title: Text(AdvisorLocalizations.of(context).title),
          ),
          body: TabBarView(
            //                children: [LocationsSearchBar(), LocationsSearchBarFilter()]),
              children: [LocationsSearchBar(), AttractionDetails()]),
        ));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const AdvisorLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('pl', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabControllerApp(),
    );
  }
}

void main() {
  runApp(MyApp());
}
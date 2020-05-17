import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristadvisor/Favorites/FavoritesDB.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Locale/I18n.dart';
import 'LocationSearchBar/LocationsSearchBar.dart';
import 'LocationSearchBar/LocationsSearchBarFilter.dart';

void main() {
  runApp(
      Provider<FavoritesDB>(
        create: (context) => FavoritesDB(),
        child: MyApp(),
        dispose: (context, db) => db.close(),
      )
  );
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
              children: [LocationsSearchBar(), LocationsSearchBarFilter()]),
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

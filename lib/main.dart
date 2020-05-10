import 'package:flutter/material.dart';
import 'package:touristadvisor/HotelDetails.dart';
import 'package:touristadvisor/LocationDetailView/AirportDetails.dart';
import 'LocationsSearchBar.dart';
import 'LocationsSearchBarFilter.dart';
import 'package:touristadvisor/AttractionDetails.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'I18n.dart';
import 'package:permission_handler/permission_handler.dart';

class DefaultTabControllerApp extends StatelessWidget {

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
  _permissionGranted = await location.requestPermission();
  if (_permissionGranted != PermissionStatus.granted) {
  return;
  }
  }
  
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
//                            children: [LocationsSearchBar(), LocationsSearchBarFilter()]),
                            children: [LocationsSearchBar(), AirportDetails()]),
//              children: [
//                LocationsSearchBar(),
//                AttractionDetails()
//              ]
//          ),
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
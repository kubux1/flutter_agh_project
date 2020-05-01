import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristadvisor/AttractionDetails.dart';
import 'package:touristadvisor/Favourites/FavouritesDB.dart';
import 'Favourites/Favourites.dart';
import 'LocationsSearchBar.dart';
import 'LocationsSearchBarFilter.dart';

void main() {
  runApp(
      Provider<FavouritesDB>(
        create: (context) => FavouritesDB(),
        child: MyApp(),
        dispose: (context, db) => db.close(),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(   // There should be only one MaterialApp in the project
      debugShowCheckedModeBanner: false,
      title: 'LocationAdvisor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
          // The number of tabs / content sections we need to display
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.search)),
                Tab(icon: Icon(Icons.filter_list)),
                Tab(icon: Icon(Icons.favorite))
              ]),
              title: Text("Location Advisor"),
            ),
            body: TabBarView(
                children: [LocationsSearchBar(), LocationsSearchBarFilter(), Favourites()]),
          )),
    );
  }
}

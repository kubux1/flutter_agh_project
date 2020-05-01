import 'package:flutter/material.dart';
import 'package:touristadvisor/AttractionDetails.dart';
import 'LocationsSearchBar.dart';
import 'LocationsSearchBarFilter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LocationAdvisor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
          // The number of tabs / content sections we need to display
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.search)),
                Tab(icon: Icon(Icons.filter_list))
              ]),
              title: Text("Location Advisor"),
            ),
            body: TabBarView(
//                children: [LocationsSearchBar(), LocationsSearchBarFilter()]),
                  children: [LocationsSearchBar(), AttractionDetails()]),
          )),
    );
  }
}

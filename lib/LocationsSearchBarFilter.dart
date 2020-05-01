import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'LocationsSearchBar.dart';

class LocationsSearchBarFilter extends StatefulWidget {
  @override
  SliderExampleState createState() {
    return new SliderExampleState();
  }
}

class SliderExampleState extends State with AutomaticKeepAliveClientMixin {
  static int _kmRadius = 1;

  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Center(
            child: Column(children: [
          Slider(
            value: _kmRadius.toDouble(),
            min: 1.0,
            max: 30.0,
            divisions: 30,
            onChanged: (double newValue) {
              LocationsSearchBar.onSliderMoved(newValue.round());
              setState(() {
                _kmRadius = newValue.round();
              });
            },
          ),
          Text("Radius " + _kmRadius.toString() + " km"),
          CheckboxGroup(
            labels: <String>[
              "Restaurants",
              "Attractions",
              "Hotels",
              "Airports"
            ],
            onSelected: LocationsSearchBar.onCheckBoxSelected,
          ),
        ])),
      )));
  }
}

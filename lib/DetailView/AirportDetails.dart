import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:touristadvisor/Model/AirportModel.dart';

// ignore: must_be_immutable
class AirportDetails extends StatefulWidget {
  AirportModel airportModel;

  AirportDetails(AirportModel airportModel) {
    this.airportModel = airportModel;
  }

  @override
  AirportDetailsState createState() => AirportDetailsState(airportModel);
}

class AirportDetailsState extends State<AirportDetails> {
  AirportModel airportModel;

  AirportDetailsState(AirportModel airportModel) {
    this.airportModel = airportModel;
  }

  final Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(airportModel.display_name),
          backgroundColor: Colors.blue,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(airportModel.latitude, airportModel.longitude),
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}

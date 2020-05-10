import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:touristadvisor/Model/AirportModel.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AirportDetails extends StatefulWidget {
  @override
  AirportDetailsState createState() => AirportDetailsState();
}

class AirportDetailsState extends State<AirportDetails> {
  final AirportModel airportModel = new AirportModel.example();
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
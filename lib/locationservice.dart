import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String locationMessage = "Fetching location...";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationService locationService = LocationService();
    try {
      Position position = await locationService.getCurrentLocation();
      setState(() {
        locationMessage = "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
      });
    } catch (e) {
      setState(() {
        locationMessage = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Screen'),
      ),
      body: Center(
        child: Text(
          locationMessage,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}

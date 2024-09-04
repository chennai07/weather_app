import 'package:geolocator/geolocator.dart';

class LocationService {
  // Method to check if location services are enabled
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  // Method to request location permission
  Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();
  }

  // Method to get the current location
  Future<Position> getCurrentLocation() async {
    // Check if location services are enabled
    bool serviceEnabled = await isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Request location permission
    LocationPermission permission = await requestPermission();
    if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
      throw Exception('Location permission not granted.');
    }

    // Get the current position
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}

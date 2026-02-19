import 'dart:io' show Platform;

import 'package:geolocator/geolocator.dart';

import '../domain/location_result.dart';

class LocationService {
  Future<LocationResult> getCurrentLocation() async {
    // On Linux, geolocator is not supported, so return a mock location
    if (Platform.isLinux) {
      // Mock location (e.g., San Francisco)
      return LocationResult(latitude: 37.7749, longitude: -122.4194);
    }

    // Ensure service enabled
    final enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) {
      throw Exception('Location services are disabled.');
    }

    // Permissions
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      throw Exception('Location permission denied.');
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Location permission permanently denied. Enable it in settings.',
      );
    }

    final pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return LocationResult(latitude: pos.latitude, longitude: pos.longitude);
  }
}

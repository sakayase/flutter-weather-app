import 'package:geolocator/geolocator.dart';

class LocationError extends Error {
  LocationError({required this.message, this.permission});
  String message;
  LocationPermission? permission;
}

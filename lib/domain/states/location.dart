import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/domain/controllers/location.dart';
import 'package:weather_app/foundation/errors.dart';

class LocationState extends ChangeNotifier {
  LocationState({
    required this.controller,
  });

  LocationController controller;
  LocationError? error;
  Location? location;
  bool unknownError = false;

  findLocation() async {
    try {
      Position position = await controller.getPosition();
      Location location = Location(
        lat: position.latitude,
        lon: position.longitude,
      );
      setError(null);
      setUnknownError(false);
      setLocation(location);
    } on LocationError catch (e) {
      setError(e);
    } catch (e) {
      setUnknownError(true);
    }
  }

  setLocation(Location location) {
    this.location = location;
    notifyListeners();
  }

  setError(LocationError? error) {
    this.error = error;
    notifyListeners();
  }

  setUnknownError(bool unknownError) {
    this.unknownError = unknownError;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/domain/location.dart';

class LocationState extends ChangeNotifier {
  LocationState({
    required this.locationFinder,
  });

  LocationFinder locationFinder;

  Location? location;

  findLocation() async {
    Position position = await locationFinder.getPosition();
    Location location = Location(
      lat: position.latitude,
      lon: position.longitude,
    );
    setLocation(location);
  }

  setLocation(Location location) {
    this.location = location;
  }
}

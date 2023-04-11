import 'package:geolocator/geolocator.dart';
import 'package:weather_app/foundation/errors.dart';

class LocationFinder {
  Position? lastCheckedPosition;
  Future<bool> _testPermission() async {
    bool enabled;
    LocationPermission permission;

    enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) {
      return Future.error(
        LocationError(
          message: 'Location services are disabled.',
        ),
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(
          LocationError(
            message: 'Location permissions are denied',
            permission: permission,
          ),
        );
      }
    }

    return true;
  }

  Future<Position> getPosition() async {
    try {
      await _testPermission();
      Position position = await Geolocator.getCurrentPosition();
      lastCheckedPosition = position;
      return position;
    } on LocationError catch (e) {
      rethrow;
    }
  }
}

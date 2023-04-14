import 'package:geolocator/geolocator.dart';
import 'package:weather_app/foundation/errors.dart';

class LocationController {
  Position? lastCheckedPosition;

  Future _testPermission() async {
    bool enabled;
    LocationPermission permission;
    try {
      enabled = await Geolocator.isLocationServiceEnabled();
      if (!enabled) {
        throw LocationError(
          message: 'Location services are disabled.',
          permission: LocationPermission.unableToDetermine,
        );
      }

      permission = await Geolocator.checkPermission();
      print(permission);
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if ((permission == LocationPermission.denied) ||
            (permission == LocationPermission.deniedForever)) {
          throw LocationError(
            message: 'Location permissions are denied',
            permission: permission,
          );
        }
      }
      if (permission == LocationPermission.deniedForever) {
        throw LocationError(
          message: 'Location permissions are permanently denied',
          permission: permission,
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Position> getPosition() async {
    try {
      await _testPermission();
      Position position = await Geolocator.getCurrentPosition();
      lastCheckedPosition = position;
      return position;
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:weather_app/application/init.dart';
import 'package:weather_app/data/api/weather.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/models/weather.dart';

class WeatherController {
  WeatherAPI api = getIt.get<WeatherAPI>();

  Future<Weather?> getWeather(Location location) async {
    return await api.getCurrentWeather(location);
  }
}

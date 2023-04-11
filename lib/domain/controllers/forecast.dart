import 'package:weather_app/application/init.dart';
import 'package:weather_app/data/api/weather.dart';
import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/location.dart';

class ForecastController {
  WeatherAPI api = getIt.get<WeatherAPI>();

  Future<Forecast?> getForecast(Location location) async {
    Forecast? forecast = await api.getDaysForecast(location);
    return forecast;
  }
}

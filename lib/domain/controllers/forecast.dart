import 'package:flutter/material.dart';
import 'package:weather_app/application/init.dart';
import 'package:weather_app/data/api/weather.dart';
import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/foundation/settings.dart';

class ForecastController {
  WeatherAPI api = getIt.get<WeatherAPI>();

  Future<Forecast?> getDaysForecast(Location location) async {
    Forecast? forecast = await api.getDaysForecast(location);
    return forecast;
  }

  Future<DateTime?> promptDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: Settings.nbForecastDay - 1),
      ),
    );
  }
}

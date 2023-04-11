import 'package:flutter/material.dart';
import 'package:weather_app/data/api/weather.dart';
import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/foundation/settings.dart';

class ForecastState with ChangeNotifier {
  ForecastState({
    required this.api,
  });
  WeatherAPI api;
  Forecast? forecast;
  DateTime selectedDate = DateTime.now();

  setSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  setForecast(Forecast? forecast) {
    this.forecast = forecast;
    notifyListeners();
  }

  Future<void> getForecast(Location location) async {
    setForecast(await api.getDaysForecast(location));
  }

  Future<DateTime?> promptDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: Settings.nbForecastDay - 1),
      ),
    );
    setSelectedDate(date ?? selectedDate);
    return date;
  }
}

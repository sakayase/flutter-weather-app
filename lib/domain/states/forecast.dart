import 'package:flutter/material.dart';
import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/domain/controllers/forecast.dart';

class ForecastState with ChangeNotifier {
  ForecastState({
    required this.controller,
  });
  ForecastController controller;
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
    setForecast(await controller.getDaysForecast(location));
  }

  Future<DateTime?> promptDate(BuildContext context) async {
    DateTime? date = await controller.promptDate(context, selectedDate);
    setSelectedDate(date ?? selectedDate);
    return date;
  }
}

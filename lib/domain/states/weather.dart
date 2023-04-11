import 'package:flutter/material.dart';
import 'package:weather_app/data/api/weather.dart';
import 'package:weather_app/data/models/weather.dart';

class WeatherState extends ChangeNotifier {
  WeatherState({
    required this.api,
  });
  WeatherAPI api;

  Weather? weather;

  setWeather(Weather weather) {
    this.weather = weather;
  }
}

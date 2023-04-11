import 'package:flutter/material.dart';
import 'package:weather_app/data/api/weather.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/domain/controllers/weather.dart';

class WeatherState extends ChangeNotifier {
  WeatherState({
    required this.controller,
  });
  WeatherController controller;

  Weather? weather;

  setWeather(Weather? weather) {
    this.weather = weather;
  }

  Future<Weather?> getWeather(Location location) async {
    Weather? weather = await controller.getWeather(location);
    setWeather(weather);
    return weather;
  }
}

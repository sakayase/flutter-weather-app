import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/env.dart';
import 'package:weather_app/foundation/settings.dart';
import 'package:weather_app/foundation/utils.dart';

class WeatherAPI {
  Locale locale = getLocale();

  Future<Weather?> getCurrentWeather(Location location) async {
    String latLon = '${location.lat},${location.lon}';
    Uri url = Uri.parse(
        '${env.apiUrl}/current.json?key=${env.weatherApiKey}&q=$latLon&lang=${locale.languageCode}');
    try {
      var resp = await http.get(url);
      if (resp.statusCode == 200) {
        Weather weather = Weather.fromJson(jsonDecode(resp.body));
        return weather;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<Forecast?> getDaysForecast(Location location) async {
    String latLon = '${location.lat},${location.lon}';
    Uri url = Uri.parse(
        '${env.apiUrl}/forecast.json?key=${env.weatherApiKey}&q=$latLon&lang=${locale.languageCode}&days=${Settings.nbForecastDay}');
    try {
      var resp = await http.get(url);
      if (resp.statusCode == 200) {
        Forecast forecast = Forecast.fromJson(jsonDecode(resp.body));
        return forecast;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}

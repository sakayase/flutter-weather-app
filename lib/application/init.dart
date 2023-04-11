import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/data/api/weather.dart';
import 'package:weather_app/domain/location.dart';
import 'package:weather_app/domain/locale.dart';

GetIt getIt = GetIt.I;

init() {
  WidgetsFlutterBinding.ensureInitialized();
  getLocale();
  getIt.registerSingleton<LocationFinder>(LocationFinder());
  getIt.registerSingleton<WeatherAPI>(WeatherAPI());
}

getLocale() {
  final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
  getIt.registerSingleton<SystemLocale>(
      SystemLocale(locale: systemLocales.first));
}

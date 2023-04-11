import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/data/api/autocomplete.dart';
import 'package:weather_app/data/api/weather.dart';
import 'package:weather_app/domain/controllers/location.dart';
import 'package:weather_app/domain/controllers/locale.dart';

GetIt getIt = GetIt.I;

init() {
  WidgetsFlutterBinding.ensureInitialized();
  checkLocale();
  getIt.registerSingleton<LocationController>(LocationController());
  getIt.registerSingleton<WeatherAPI>(WeatherAPI());
  getIt.registerSingleton<AutocompleteAPI>(AutocompleteAPI());
}

checkLocale() {
  final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
  getIt.registerSingleton<SystemLocale>(
      SystemLocale(locale: systemLocales.first));
}

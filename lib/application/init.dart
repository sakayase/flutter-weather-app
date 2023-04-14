import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/data/api/autocomplete.dart';
import 'package:weather_app/data/api/weather.dart';
import 'package:weather_app/domain/controllers/autocomplete.dart';
import 'package:weather_app/domain/controllers/forecast.dart';
import 'package:weather_app/domain/controllers/location.dart';
import 'package:weather_app/domain/controllers/weather.dart';
import 'package:weather_app/domain/states/locale.dart';
import 'package:weather_app/presentation/route/app_router.dart';

GetIt getIt = GetIt.I;
AppRouter appRouter = AppRouter();

init() {
  WidgetsFlutterBinding.ensureInitialized();
  checkLocale();
  getIt.registerSingleton<LocationController>(LocationController());
  getIt.registerSingleton<WeatherAPI>(WeatherAPI());
  getIt.registerSingleton<WeatherController>(WeatherController());
  getIt.registerSingleton<AutocompleteAPI>(AutocompleteAPI());
  getIt.registerSingleton<AutocompleteController>(AutocompleteController());
  getIt.registerSingleton<ForecastController>(ForecastController());
}

checkLocale() {
  final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
  getIt.registerSingleton<LocalisationState>(LocalisationState(
      locale: systemLocales.first, celsius: true, metric: true));
}

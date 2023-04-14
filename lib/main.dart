import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/application/init.dart';
import 'package:weather_app/domain/controllers/autocomplete.dart';
import 'package:weather_app/domain/controllers/forecast.dart';
import 'package:weather_app/domain/controllers/location.dart';
import 'package:weather_app/domain/controllers/weather.dart';
import 'package:weather_app/domain/states/autocomplete.dart';
import 'package:weather_app/domain/states/forecast.dart';
import 'package:weather_app/domain/states/locale.dart';
import 'package:weather_app/domain/states/location.dart';
import 'package:weather_app/domain/states/weather.dart';
import 'package:weather_app/style.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ForecastState(
            controller: getIt.get<ForecastController>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => AutocompleteState(
            controller: getIt.get<AutocompleteController>(),
          ),
        ),
        ChangeNotifierProvider<LocationState>(
          create: (_) => LocationState(
            controller: getIt.get<LocationController>(),
          ),
        ),
        ChangeNotifierProvider<WeatherState>(
          create: (_) => WeatherState(
            controller: getIt.get<WeatherController>(),
          ),
        ),
        ChangeNotifierProvider<LocalisationState>(
          create: (_) => getIt.get<LocalisationState>(),
        )
      ],
      child: MaterialApp.router(
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
        title: 'Weather App',
        theme: theme,
      ),
    );
  }
}

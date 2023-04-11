import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/application/init.dart';
import 'package:weather_app/data/api/weather.dart';
import 'package:weather_app/domain/location.dart';
import 'package:weather_app/domain/states/location.dart';
import 'package:weather_app/domain/states/weather.dart';
import 'package:weather_app/presentation/ui/landing_screen.dart';

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
        ChangeNotifierProvider<LocationState>(
          create: (_) => LocationState(
            locationFinder: getIt.get<LocationFinder>(),
          ),
        ),
        ChangeNotifierProvider<WeatherState>(
          create: (_) => WeatherState(
            api: getIt.get<WeatherAPI>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LandingScreen(),
      ),
    );
  }
}

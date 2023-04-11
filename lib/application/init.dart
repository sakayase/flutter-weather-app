import 'package:get_it/get_it.dart';
import 'package:weather_app/data/api/weather.dart';
import 'package:weather_app/domain/location.dart';

GetIt getIt = GetIt.I;

init() {
  getIt.registerSingleton<LocationFinder>(LocationFinder());
  getIt.registerSingleton<WeatherAPI>(WeatherAPI());
}

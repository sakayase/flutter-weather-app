import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/domain/states/location.dart';
import 'package:weather_app/domain/states/weather.dart';
import 'package:weather_app/presentation/widget/weather_card.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<LocationState>().location != null
        ? FutureBuilder(
            future: context
                .read<WeatherState>()
                .getWeather(context.watch<LocationState>().location!),
            builder: (context, AsyncSnapshot<Weather?> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                      'Une erreur est survenue lors de la récupération de la météo. Réessayez plus tard.'),
                );
              }

              if (snapshot.connectionState != ConnectionState.done) {
                const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return snapshot.data != null
                  ? WeatherCard(weather: snapshot.data!)
                  : const Center(child: CircularProgressIndicator());
            },
          )
        : const Center(
            child: Text('Recherche de la localisation'),
          );
  }
}

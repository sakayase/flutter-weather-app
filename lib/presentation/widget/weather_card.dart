import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/domain/states/locale.dart';
import 'package:weather_app/foundation/settings.dart';
import 'package:weather_app/foundation/utils.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.weather});
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      weather.location != null
                          ? Text(
                              weather.location!.name ?? '',
                              style: Theme.of(context).textTheme.titleLarge,
                            )
                          : const SizedBox.shrink(),
                      Text(
                        formatToday(DateTime.now()),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/weather/64x64/${weather.isDay ? 'day' : 'night'}/${Settings.iconList.where((element) => (element.code == weather.condition.code)).first.icon}.png',
                        fit: BoxFit.fill,
                        width: 150,
                        height: 150,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    Text(
                      weather.condition.text,
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TemperatureCard(weather: weather),
                    WindCard(weather: weather),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TemperatureCard extends StatelessWidget {
  const TemperatureCard({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              weather.getTemp((context.watch<LocalisationState>().celsius)),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ressenti : ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(weather.getFeelsLiks(
                    (context.watch<LocalisationState>().celsius))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WindCard extends StatelessWidget {
  const WindCard({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.wind_power,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                Text(weather
                    .getWind((context.watch<LocalisationState>().metric))),
              ],
            ),
            getIconWindDirection(weather.windDirection, context),
            Text(
              weather.windDirection.name,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}

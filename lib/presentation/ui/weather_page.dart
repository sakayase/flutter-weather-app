import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/domain/states/location.dart';
import 'package:weather_app/domain/states/weather.dart';
import 'package:weather_app/presentation/widget/weather_card.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  bool shouldRequest = false;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (shouldRequest) {
        setState(() {
          shouldRequest = false;
        });
        checkLocation();
      }
    }
  }

  checkLocation() async {
    await context.read<LocationState>().findLocation();
  }

  @override
  Widget build(BuildContext context) {
    LocationState locationState = context.watch<LocationState>();
    if (locationState.unknownError) {
      return const Center(
        child: Text(
          'Une erreur inconnue est survenue lors de la récupération de votre position.',
          textAlign: TextAlign.center,
        ),
      );
    }

    if (locationState.error != null) {
      if ((locationState.error!.permission == LocationPermission.denied) ||
          (locationState.error!.permission ==
              LocationPermission.deniedForever)) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Veuillez accorder la permission d\'utiliser votre localisation.',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  shouldRequest = true;
                });
                await AppSettings.openLocationSettings();
              },
              child: const Text('Ouvrir mes paramètres'),
            ),
          ],
        );
      }

      if (locationState.error!.permission ==
          LocationPermission.unableToDetermine) {
        return const Center(
          child: Text(
            'La localisation n\'est pas disponible.',
            textAlign: TextAlign.center,
          ),
        );
      }
    }

    return locationState.location != null
        ? FutureBuilder(
            future: context
                .read<WeatherState>()
                .getWeather(locationState.location!),
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

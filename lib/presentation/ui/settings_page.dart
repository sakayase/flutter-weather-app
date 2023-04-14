import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/domain/states/locale.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Utiliser le systeme metrique :'),
          trailing: Checkbox(
            value: context.watch<LocalisationState>().metric,
            onChanged: (bool? value) {
              if (value != null) {
                context.read<LocalisationState>().setMetric(value);
              }
            },
          ),
        ),
        ListTile(
          title: const Text('Utiliser le degré Celcius :'),
          trailing: Checkbox(
            value: context.watch<LocalisationState>().celsius,
            onChanged: (bool? value) {
              if (value != null) {
                context.read<LocalisationState>().setCelsius(value);
              }
            },
          ),
        ),
      ],
    );
  }
}

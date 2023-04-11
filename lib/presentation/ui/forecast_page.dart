import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widget/display_forecast.dart';
import 'package:weather_app/presentation/widget/search_bar.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 56, 0, 0),
          child: DisplayForecast(),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 56,
            maxHeight: 412,
          ),
          child: const Material(
            elevation: 2,
            color: Colors.transparent,
            child: SearchBar(),
          ),
        ),
      ],
    );
  }
}

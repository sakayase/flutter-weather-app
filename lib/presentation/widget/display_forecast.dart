import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/forecast_day.dart';
import 'package:weather_app/domain/states/forecast.dart';
import 'package:weather_app/foundation/utils.dart';
import 'package:weather_app/presentation/widget/forecast_day_card.dart';

class DisplayForecast extends StatelessWidget {
  const DisplayForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    ForecastState forecastState = context.watch<ForecastState>();
    Forecast? forecast = forecastState.forecast;

    if (forecast != null) {
      List<ForecastDay> days = forecast.days;

      return PageView.builder(
        itemCount: days.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DisplayDay(
              day: days[index],
            ),
          );
        },
      );
    }
    return const SizedBox.shrink();
  }
}

class DisplayDay extends StatelessWidget {
  const DisplayDay({Key? key, required this.day}) : super(key: key);
  final ForecastDay day;

  @override
  Widget build(BuildContext context) {
    DateTime? date = dateTimeFromUnixTime(day.dateEpoct);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            SizedBox(
              width: 250,
              height: 400,
              child: ForecastDayCard(date: date, day: day),
            ),
            Expanded(
              child: DisplayHours(hours: day.hour ?? []),
            )
          ],
        ),
      ),
    );
  }
}

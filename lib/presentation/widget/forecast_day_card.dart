import 'package:flutter/material.dart';
import 'package:weather_app/data/models/forecast_day.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/foundation/settings.dart';
import 'package:weather_app/foundation/utils.dart';

class ForecastDayCard extends StatelessWidget {
  const ForecastDayCard({
    super.key,
    required this.date,
    required this.day,
  });

  final DateTime date;
  final ForecastDay day;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          formatDate(date),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/weather/64x64/day/${Settings.iconList.where((element) => (element.code == day.condition.code)).first.icon}.png',
            fit: BoxFit.fill,
            width: 150,
            height: 150,
            filterQuality: FilterQuality.high,
          ),
        ),
        Text(
          day.condition.text,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Moyenne',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${day.avgTempC}°C',
                    ),
                  ),
                ],
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Min',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${day.minTempC}°C'),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Max',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${day.maxTempC}°C'),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class DisplayHours extends StatelessWidget {
  const DisplayHours({Key? key, required this.hours}) : super(key: key);
  final List<Weather> hours;

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemCount: hours.length,
        itemBuilder: (context, index) {
          Weather hour = hours[index];
          DateTime date = dateTimeFromUnixTime(hour.dateEpoch ?? 0);

          String? text;
          if (hour.condition.iconData != null) {
            if (hour.isDay) {
              text = hour.condition.iconData!.day;
            } else {
              text = hour.condition.iconData!.night;
            }
          }

          return SizedBox(
            height: double.infinity,
            width: 150,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    formatHour(date),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                        'assets/weather/64x64/${hour.isDay ? 'day' : 'night'}/${Settings.iconList.where((element) => (element.code == hour.condition.code)).first.icon}.png'),
                  ),
                  Text(
                    text ?? hour.condition.text,
                    style: Theme.of(context).textTheme.labelLarge,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${hour.celciusTemp.toString()}°C'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

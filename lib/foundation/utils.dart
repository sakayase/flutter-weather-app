// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/application/init.dart';
import 'package:weather_app/data/models/icon_data.dart' as app_data;
import 'package:weather_app/domain/states/locale.dart';
import 'package:weather_app/foundation/settings.dart';

DateTime dateTimeFromUnixTime(int unixTime) {
  return DateTime.fromMillisecondsSinceEpoch(unixTime * 1000).toLocal();
}

Locale getLocale() {
  LocalisationState systemLocale = getIt.get<LocalisationState>();
  return systemLocale.locale;
}

String formatDate(DateTime date) {
  return DateFormat('dd/MM').format(date);
}

String formatToday(DateTime date) {
  return DateFormat('EEE, MMM d').format(date);
}

String formatHour(DateTime date) {
  return DateFormat('HH:mm').format(date);
}

bool intToBool(int int) {
  return int != 0;
}

app_data.IconData getConditionIconFromCode(int code) {
  return Settings.iconList.firstWhere((element) => element.code == code);
}

class NavigationView {
  NavigationView(
      {required this.view, required this.index, required this.title});
  Widget view;
  int index;
  String title;
}

enum WindDirection {
  N,
  NNE,
  NE,
  ENE,
  E,
  ESE,
  SE,
  SSE,
  S,
  SSW,
  SW,
  WSW,
  W,
  NW,
  WNW,
  NNW
}

Widget getIconWindDirection(WindDirection windDirection, BuildContext context) {
  double rad;

  switch (windDirection) {
    case WindDirection.N:
      rad = (3 / 2) * pi;
      break;
    case WindDirection.NNE:
      rad = (5 / 3) * pi;
      break;
    case WindDirection.NE:
      rad = (7 / 4) * pi;
      break;
    case WindDirection.ENE:
      rad = (11 / 6) * pi;
      break;
    case WindDirection.E:
      rad = 0;
      break;
    case WindDirection.ESE:
      rad = pi / 6;
      break;
    case WindDirection.SE:
      rad = pi / 4;
      break;
    case WindDirection.SSE:
      rad = pi / 3;
      break;
    case WindDirection.S:
      rad = pi / 2;
      break;
    case WindDirection.SSW:
      rad = (2 / 3) * pi;
      break;
    case WindDirection.SW:
      rad = (3 / 4) * pi;
      break;
    case WindDirection.WSW:
      rad = (5 / 6) * pi;
      break;
    case WindDirection.W:
      rad = pi;
      break;
    case WindDirection.WNW:
      rad = (6 / 7) * pi;
      break;
    case WindDirection.NNW:
      rad = (4 / 3) * pi;
      break;
    case WindDirection.NW:
      rad = (5 / 4) * pi;
      break;
    default:
      rad = 0;
      break;
  }
  return Transform.rotate(
    angle: rad,
    child: Icon(
      Icons.east,
      color: Theme.of(context).colorScheme.tertiary,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/application/init.dart';
import 'package:weather_app/data/models/icon_data.dart' as app_data;

import 'package:weather_app/domain/controllers/locale.dart';
import 'package:weather_app/foundation/settings.dart';

DateTime dateTimeFromUnixTime(int unixTime) {
  return DateTime.fromMillisecondsSinceEpoch(unixTime * 1000).toLocal();
}

Locale getLocale() {
  SystemLocale systemLocale = getIt.get<SystemLocale>();
  return systemLocale.locale;
}

String formatDate(DateTime date) {
  return DateFormat('dd/MM').format(date);
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
  NavigationView({required this.view, required this.index});
  Widget view;
  int index;
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/application/init.dart';

import 'package:weather_app/domain/controllers/locale.dart';

Locale getLocale() {
  SystemLocale systemLocale = getIt.get<SystemLocale>();
  return systemLocale.locale;
}

String formatDate(DateTime date) {
  return DateFormat('dd/MM').format(date);
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

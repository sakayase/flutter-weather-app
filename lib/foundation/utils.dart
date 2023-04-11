import 'package:flutter/material.dart';
import 'package:weather_app/domain/states/locale.dart';

import '../application/init.dart';

Locale getLocale() {
  SystemLocale systemLocale = getIt.get<SystemLocale>();
  return systemLocale.locale;
}

import 'package:flutter/material.dart';
import 'package:weather_app/domain/controllers/locale.dart';

import '../application/init.dart';

Locale getLocale() {
  SystemLocale systemLocale = getIt.get<SystemLocale>();
  return systemLocale.locale;
}

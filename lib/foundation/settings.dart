import 'dart:convert';

import 'package:weather_app/data/models/icon_data.dart';
import 'package:weather_app/json_icons.dart';

class Settings {
  // Doit etre comprit entre 1 et 14 car weatherapi limite le nombre
  static int nbForecastDay = 7;

  static List iconMapList = (jsonDecode(jsonIconsArray) as List);
  static List<IconData> iconList = iconMapList
      .map((e) => IconData.fromJson(e as Map<String, dynamic>))
      .toList();
}

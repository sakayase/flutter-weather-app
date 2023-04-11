import 'dart:convert';

import 'package:weather_app/data/models/condition_icon.dart';
import 'package:weather_app/json_icons.dart';

class Settings {
  // Doit etre comprit entre 1 et 14 car weatherapi limite le nombre
  static int nbForecastDay = 7;

  static List iconMapList = (jsonDecode(jsonIconsArray) as List);
  static List<ConditionIcon> iconList = iconMapList
      .map((e) => ConditionIcon.fromJson(e as Map<String, dynamic>))
      .toList();
}

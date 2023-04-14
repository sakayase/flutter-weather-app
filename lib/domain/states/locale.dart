import 'package:flutter/material.dart';

class LocalisationState extends ChangeNotifier {
  LocalisationState({
    required this.locale,
    required this.metric,
    required this.celsius,
  });

  Locale locale;
  bool metric;
  bool celsius;

  setMetric(bool metric) {
    this.metric = metric;
    notifyListeners();
  }

  setCelsius(bool celsius) {
    this.celsius = celsius;
    notifyListeners();
  }
}

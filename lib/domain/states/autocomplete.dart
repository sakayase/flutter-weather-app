import 'package:flutter/material.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/domain/controllers/autocomplete.dart';

class AutocompleteState extends ChangeNotifier {
  AutocompleteState({
    required this.controller,
  });
  AutocompleteController controller;
  List<Location> suggestions = [];
  Location? selectedLocation;

  setSuggestions(List<Location>? suggestions) {
    this.suggestions = suggestions ?? [];
    notifyListeners();
  }

  setSelectedLocation(Location? location) {
    selectedLocation = location;
    suggestions = [];
    notifyListeners();
  }

  Future<List<Location>> getSuggestionsFromPlaceName(String placeName) async {
    setSuggestions(await controller.getSuggestionsFromPlaceName(placeName));
    return suggestions;
  }
}

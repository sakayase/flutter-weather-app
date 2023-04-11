import 'package:flutter/material.dart';
import 'package:weather_app/data/api/autocomplete.dart';
import 'package:weather_app/data/models/location.dart';

class AutocompleteState extends ChangeNotifier {
  AutocompleteState({
    required this.api,
  });
  AutocompleteAPI api;
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
    setSuggestions(await api.getSuggestionsByPlaceName(placeName));
    return suggestions;
  }
}

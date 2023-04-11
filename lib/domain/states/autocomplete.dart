import 'package:flutter/material.dart';
import 'package:weather_app/data/api/autocomplete.dart';
import 'package:weather_app/data/models/location.dart';

class AutocompleteState extends ChangeNotifier {
  AutocompleteState({
    required this.api,
  });
  List<Location> suggestions = [];
  AutocompleteAPI api;

  setSuggestions(List<Location>? suggestions) {
    this.suggestions = suggestions ?? [];
    notifyListeners();
  }

  Future<List<Location>> getSuggestionsFromPlaceName(String placeName) async {
    setSuggestions(await api.getSuggestionsByPlaceName(placeName));
    return suggestions;
  }
}

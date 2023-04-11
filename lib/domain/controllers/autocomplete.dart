import 'package:weather_app/application/init.dart';
import 'package:weather_app/data/api/autocomplete.dart';
import 'package:weather_app/data/models/location.dart';

class AutocompleteController {
  AutocompleteAPI api = getIt.get<AutocompleteAPI>();

  Future<List<Location>?> getSuggestions(String placeName) async {
    List<Location> suggestions;
    suggestions = await api.getSuggestionsByPlaceName(placeName) ?? [];
    return suggestions;
  }
}

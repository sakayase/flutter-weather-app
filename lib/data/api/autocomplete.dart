import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/env.dart';
import 'package:weather_app/foundation/utils.dart';

class AutocompleteAPI {
  Locale locale = getLocale();

  Future<List<Location>?> getSuggestionsByPlaceName(String placeName) async {
    Uri url = Uri.parse(
        '${env.apiUrl}/search.json?key=${env.weatherApiKey}&q=$placeName&lang=${locale.languageCode}');
    try {
      var resp = await http.get(url);
      if (resp.statusCode == 200) {
        List dataList = jsonDecode(resp.body);
        List<Location> locationList = [];
        for (var locationJson in dataList) {
          locationList.add(Location.fromJson(locationJson));
        }
        return locationList;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/models/location.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Weather({
    this.location,
    required this.celciusTemp,
    required this.farenheitTemp,
    required this.mphWind,
    required this.kphWind,
    required this.windDirection,
    required this.celciusFeelsLike,
    required this.farenheitFeelsLike,
    this.hours,
  });

  @JsonKey(fromJson: locationFromJsonIfNotNull)
  Location? location;
  @JsonKey(name: 'temp_c', readValue: readWeather)
  double celciusTemp;
  @JsonKey(name: 'temp_f', readValue: readWeather)
  double farenheitTemp;
  @JsonKey(name: 'wind_mph', readValue: readWeather)
  double mphWind;
  @JsonKey(name: 'wind_kph', readValue: readWeather)
  double kphWind;
  @JsonKey(name: 'wind_dir', readValue: readWeather)
  String windDirection;
  @JsonKey(name: 'feelslike_c', readValue: readWeather)
  double celciusFeelsLike;
  @JsonKey(name: 'feelslike_f', readValue: readWeather)
  double farenheitFeelsLike;
  List<Weather>? hours;

  static readWeather(Map map, String string) {
    if (map['current'] != null) {
      return map['current'][string];
    }
    return map[string];
  }

  static Location? locationFromJsonIfNotNull(Map<String, dynamic>? json) {
    if (json != null) {
      return Location.fromJson(json);
    }
    return null;
  }

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
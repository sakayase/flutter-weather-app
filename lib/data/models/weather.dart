import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/models/location.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  Weather({
    required this.location,
    required this.celciusTemp,
    required this.farenheitTemp,
    required this.mphWind,
    required this.kphWind,
    required this.windDirection,
    required this.celciusFeelsLike,
    required this.farenheitFeelsLike,
    this.hours,
  });

  @JsonKey(fromJson: Location.fromJson)
  Location location;
  @JsonKey(name: 'c_temp')
  String celciusTemp;
  @JsonKey(name: 'f_temp')
  String farenheitTemp;
  @JsonKey(name: 'wind_mph')
  String mphWind;
  @JsonKey(name: 'wind_kph')
  String kphWind;
  @JsonKey(name: 'wind_dir')
  String windDirection;
  @JsonKey(name: 'feelslike_c')
  String celciusFeelsLike;
  @JsonKey(name: 'feelslike_f')
  String farenheitFeelsLike;
  List<Weather>? hours;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

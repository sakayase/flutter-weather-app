import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/models/forecast_day.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/models/weather.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  Forecast({
    this.location,
    required this.current,
    required this.days,
  });

  @JsonKey(fromJson: Location.fromJson)
  Location? location;
  @JsonKey(name: 'current', fromJson: Weather.fromJson)
  Weather current;
  @JsonKey(name: 'forecastday', readValue: readDays)
  List<ForecastDay> days;

  static readDays(Map map, String string) {
    return map['forecast'][string];
  }

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

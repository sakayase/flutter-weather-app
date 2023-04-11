import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/models/weather.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  Forecast({
    required this.location,
    required this.days,
  });

  @JsonKey(fromJson: Location.fromJson)
  Location location;
  List<Weather> days;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

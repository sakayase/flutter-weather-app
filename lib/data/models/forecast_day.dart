import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/models/condition.dart';
import 'package:weather_app/data/models/weather.dart';

part 'forecast_day.g.dart';

@JsonSerializable()
class ForecastDay {
  ForecastDay({
    required this.dateEpoct,
    required this.maxTempC,
    required this.maxTempF,
    required this.minTempC,
    required this.minTempF,
    required this.avgTempC,
    required this.avgTempF,
    required this.maxWindKph,
    required this.maxWindMph,
    required this.condition,
    this.hour,
  });

  @JsonKey(name: 'date_epoch')
  int dateEpoct;
  @JsonKey(name: 'maxtemp_c', readValue: readDay)
  double maxTempC;
  @JsonKey(name: 'maxtemp_f', readValue: readDay)
  double maxTempF;
  @JsonKey(name: 'mintemp_c', readValue: readDay)
  double minTempC;
  @JsonKey(name: 'mintemp_f', readValue: readDay)
  double minTempF;
  @JsonKey(name: 'avgtemp_c', readValue: readDay)
  double avgTempC;
  @JsonKey(name: 'avgtemp_f', readValue: readDay)
  double avgTempF;
  @JsonKey(name: 'maxwind_kph', readValue: readDay)
  double maxWindKph;
  @JsonKey(name: 'maxwind_mph', readValue: readDay)
  double maxWindMph;
  @JsonKey(readValue: readDay)
  Condition condition;

  List<Weather>? hour;

  static readDay(Map map, String string) {
    return map['day'][string];
  }

  factory ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDayToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/data/models/weather.dart';

part 'condition.g.dart';

@JsonSerializable()
class Condition {
  Condition({required this.text, required this.iconUrl, required this.code});
  String text;
  String iconUrl;
  int code;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

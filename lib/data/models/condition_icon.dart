import 'package:json_annotation/json_annotation.dart';

part 'condition_icon.g.dart';

@JsonSerializable()
class ConditionIcon {
  ConditionIcon({
    required this.code,
    required this.day,
    required this.night,
    required this.icon,
  });
  int code;
  String day;
  String night;
  int icon;

  factory ConditionIcon.fromJson(Map<String, dynamic> json) =>
      _$ConditionIconFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionIconToJson(this);
}

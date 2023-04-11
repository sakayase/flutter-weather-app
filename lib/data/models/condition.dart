import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonSerializable()
class Condition {
  Condition({
    required this.text,
    required this.iconUrl,
    required this.code,
  });
  String text;
  @JsonKey(name: 'icon')
  String iconUrl;
  int code;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

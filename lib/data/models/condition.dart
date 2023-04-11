import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/foundation/utils.dart';

part 'condition.g.dart';

@JsonSerializable()
class Condition {
  Condition(
    this.text,
    this.iconUrl,
    this.code,
  ) {
    iconData = getIconData(code);
  }
  // Condition({
  //   required this.text,
  //   required this.iconUrl,
  //   required this.code,
  //   required this.iconData,
  // });
  String text;
  @JsonKey(name: 'icon')
  String iconUrl;
  int code;
  @JsonKey(includeFromJson: false, includeToJson: false)
  IconData? iconData;

  getIconData(int code) {
    getConditionIconFromCode(code);
  }

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

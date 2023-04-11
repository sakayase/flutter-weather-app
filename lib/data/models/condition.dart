import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/foundation/utils.dart';
import 'package:weather_app/data/models/icon_data.dart' as app_data;

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
  String text;
  @JsonKey(name: 'icon')
  String iconUrl;
  int code;
  @JsonKey(includeFromJson: false, includeToJson: false)
  app_data.IconData? iconData;

  app_data.IconData getIconData(int code) {
    return getConditionIconFromCode(code);
  }

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'icon_data.g.dart';

@JsonSerializable()
class IconData {
  IconData({
    required this.code,
    required this.day,
    required this.night,
    required this.icon,
  });
  int code;
  String day;
  String night;
  int icon;

  factory IconData.fromJson(Map<String, dynamic> json) =>
      _$IconDataFromJson(json);

  Map<String, dynamic> toJson() => _$IconDataToJson(this);
}

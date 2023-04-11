import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localTimeEpoch,
  });

  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'region')
  String region;
  @JsonKey(name: 'country')
  String country;
  @JsonKey(name: 'localtime_epoch')
  String localTimeEpoch;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

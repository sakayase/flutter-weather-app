import 'package:geolocator/geolocator.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  Location({
    this.name,
    this.region,
    this.country,
    this.localTimeEpoch,
    required this.lat,
    required this.lon,
  });

  String? name;
  String? region;
  String? country;
  @JsonKey(name: 'localtime_epoch')
  String? localTimeEpoch;
  double lat;
  double lon;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

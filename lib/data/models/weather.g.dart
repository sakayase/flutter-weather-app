// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      celciusTemp: json['c_temp'] as String,
      farenheitTemp: json['f_temp'] as String,
      mphWind: json['wind_mph'] as String,
      kphWind: json['wind_kph'] as String,
      windDirection: json['wind_dir'] as String,
      celciusFeelsLike: json['feelslike_c'] as String,
      farenheitFeelsLike: json['feelslike_f'] as String,
      hours: (json['hours'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'location': instance.location,
      'c_temp': instance.celciusTemp,
      'f_temp': instance.farenheitTemp,
      'wind_mph': instance.mphWind,
      'wind_kph': instance.kphWind,
      'wind_dir': instance.windDirection,
      'feelslike_c': instance.celciusFeelsLike,
      'feelslike_f': instance.farenheitFeelsLike,
      'hours': instance.hours,
    };

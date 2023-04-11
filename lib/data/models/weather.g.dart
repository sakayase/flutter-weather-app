// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      location: Weather.locationFromJsonIfNotNull(
          json['location'] as Map<String, dynamic>?),
      celciusTemp: (Weather.readWeather(json, 'temp_c') as num).toDouble(),
      farenheitTemp: (Weather.readWeather(json, 'temp_f') as num).toDouble(),
      mphWind: (Weather.readWeather(json, 'wind_mph') as num).toDouble(),
      kphWind: (Weather.readWeather(json, 'wind_kph') as num).toDouble(),
      windDirection: Weather.readWeather(json, 'wind_dir') as String,
      celciusFeelsLike:
          (Weather.readWeather(json, 'feelslike_c') as num).toDouble(),
      farenheitFeelsLike:
          (Weather.readWeather(json, 'feelslike_f') as num).toDouble(),
      hours: (json['hours'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'location': instance.location,
      'temp_c': instance.celciusTemp,
      'temp_f': instance.farenheitTemp,
      'wind_mph': instance.mphWind,
      'wind_kph': instance.kphWind,
      'wind_dir': instance.windDirection,
      'feelslike_c': instance.celciusFeelsLike,
      'feelslike_f': instance.farenheitFeelsLike,
      'hours': instance.hours,
    };

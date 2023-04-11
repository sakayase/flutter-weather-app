// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      location: Weather.locationFromJsonIfNotNull(
          json['location'] as Map<String, dynamic>?),
      dateEpoch: Weather.readWeather(json, 'time_epoch') as int?,
      celciusTemp: (Weather.readWeather(json, 'temp_c') as num).toDouble(),
      farenheitTemp: (Weather.readWeather(json, 'temp_f') as num).toDouble(),
      mphWind: (Weather.readWeather(json, 'wind_mph') as num).toDouble(),
      kphWind: (Weather.readWeather(json, 'wind_kph') as num).toDouble(),
      windDirection: $enumDecode(
          _$WindDirectionEnumMap, Weather.readWeather(json, 'wind_dir')),
      celciusFeelsLike:
          (Weather.readWeather(json, 'feelslike_c') as num).toDouble(),
      farenheitFeelsLike:
          (Weather.readWeather(json, 'feelslike_f') as num).toDouble(),
      condition: Condition.fromJson(
          Weather.readWeather(json, 'condition') as Map<String, dynamic>),
      isDay: intToBool(Weather.readWeather(json, 'is_day') as int),
      hours: (json['hours'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'location': instance.location,
      'time_epoch': instance.dateEpoch,
      'temp_c': instance.celciusTemp,
      'temp_f': instance.farenheitTemp,
      'wind_mph': instance.mphWind,
      'wind_kph': instance.kphWind,
      'wind_dir': _$WindDirectionEnumMap[instance.windDirection]!,
      'feelslike_c': instance.celciusFeelsLike,
      'feelslike_f': instance.farenheitFeelsLike,
      'condition': instance.condition,
      'is_day': instance.isDay,
      'hours': instance.hours,
    };

const _$WindDirectionEnumMap = {
  WindDirection.N: 'N',
  WindDirection.NNE: 'NNE',
  WindDirection.NE: 'NE',
  WindDirection.ENE: 'ENE',
  WindDirection.E: 'E',
  WindDirection.ESE: 'ESE',
  WindDirection.SE: 'SE',
  WindDirection.SSE: 'SSE',
  WindDirection.S: 'S',
  WindDirection.SSW: 'SSW',
  WindDirection.SW: 'SW',
  WindDirection.WSW: 'WSW',
  WindDirection.W: 'W',
  WindDirection.NW: 'NW',
  WindDirection.WNW: 'WNW',
  WindDirection.NNW: 'NNW',
};

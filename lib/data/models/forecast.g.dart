// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      current: Weather.fromJson(json['current'] as Map<String, dynamic>),
      days: (Forecast.readDays(json, 'forecastday') as List<dynamic>)
          .map((e) => ForecastDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecastday': instance.days,
    };

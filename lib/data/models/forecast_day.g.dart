// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDay _$ForecastDayFromJson(Map<String, dynamic> json) => ForecastDay(
      dateEpoct: json['date_epoch'] as int,
      maxTempC: (ForecastDay.readDay(json, 'maxtemp_c') as num).toDouble(),
      maxTempF: (ForecastDay.readDay(json, 'maxtemp_f') as num).toDouble(),
      minTempC: (ForecastDay.readDay(json, 'mintemp_c') as num).toDouble(),
      minTempF: (ForecastDay.readDay(json, 'mintemp_f') as num).toDouble(),
      avgTempC: (ForecastDay.readDay(json, 'avgtemp_c') as num).toDouble(),
      avgTempF: (ForecastDay.readDay(json, 'avgtemp_f') as num).toDouble(),
      maxWindKph: (ForecastDay.readDay(json, 'maxwind_kph') as num).toDouble(),
      maxWindMph: (ForecastDay.readDay(json, 'maxwind_mph') as num).toDouble(),
      condition: Condition.fromJson(
          ForecastDay.readDay(json, 'condition') as Map<String, dynamic>),
      hour: (json['hour'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastDayToJson(ForecastDay instance) =>
    <String, dynamic>{
      'date_epoch': instance.dateEpoct,
      'maxtemp_c': instance.maxTempC,
      'maxtemp_f': instance.maxTempF,
      'mintemp_c': instance.minTempC,
      'mintemp_f': instance.minTempF,
      'avgtemp_c': instance.avgTempC,
      'avgtemp_f': instance.avgTempF,
      'maxwind_kph': instance.maxWindKph,
      'maxwind_mph': instance.maxWindMph,
      'condition': instance.condition,
      'hour': instance.hour,
    };

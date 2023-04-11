// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_icon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionIcon _$ConditionIconFromJson(Map<String, dynamic> json) =>
    ConditionIcon(
      code: json['code'] as int,
      day: json['day'] as String,
      night: json['night'] as String,
      icon: json['icon'] as int,
    );

Map<String, dynamic> _$ConditionIconToJson(ConditionIcon instance) =>
    <String, dynamic>{
      'code': instance.code,
      'day': instance.day,
      'night': instance.night,
      'icon': instance.icon,
    };

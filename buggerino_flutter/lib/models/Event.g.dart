// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    url: json['url'] as String,
    receivedAt: json['received_at'] == null
        ? null
        : DateTime.parse(json['received_at'] as String),
    exceptions: (json['exceptions'] as List)
        ?.map((e) => e == null
            ? null
            : BugsnagException.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'url': instance.url,
      'received_at': instance.receivedAt?.toIso8601String(),
      'exceptions': instance.exceptions,
    };

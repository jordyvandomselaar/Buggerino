// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BugsnagError.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BugsnagError _$BugsnagErrorFromJson(Map<String, dynamic> json) {
  return BugsnagError(
    eventsUrl: json['events_url'] as String,
    errorClass: json['error_class'] as String,
    message: json['message'] as String,
    events: json['events'] as int,
    status: json['status'] as String,
    lastSeen: json['last_seen'] == null
        ? null
        : DateTime.parse(json['last_seen'] as String),
  );
}

Map<String, dynamic> _$BugsnagErrorToJson(BugsnagError instance) =>
    <String, dynamic>{
      'events_url': instance.eventsUrl,
      'error_class': instance.errorClass,
      'message': instance.message,
      'events': instance.events,
      'status': instance.status,
      'last_seen': instance.lastSeen?.toIso8601String(),
    };

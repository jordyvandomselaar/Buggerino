// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BugsnagError.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BugsnagError _$BugsnagErrorFromJson(Map<String, dynamic> json) {
  return BugsnagError(
    eventsUrl: json['eventsUrl'] as String,
    errorClass: json['errorClass'] as String,
    message: json['message'] as String,
    events: json['events'] as int,
    status: json['status'] as String,
    lastSeen: json['lastSeen'] == null
        ? null
        : DateTime.parse(json['lastSeen'] as String),
  );
}

Map<String, dynamic> _$BugsnagErrorToJson(BugsnagError instance) =>
    <String, dynamic>{
      'eventsUrl': instance.eventsUrl,
      'errorClass': instance.errorClass,
      'message': instance.message,
      'events': instance.events,
      'status': instance.status,
      'lastSeen': instance.lastSeen?.toIso8601String(),
    };

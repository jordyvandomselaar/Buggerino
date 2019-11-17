// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BugsnagException.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BugsnagException _$BugsnagExceptionFromJson(Map<String, dynamic> json) {
  return BugsnagException(
    errorClass: json['error_class'] as String,
    message: json['message'] as String,
    stacktrace: (json['stacktrace'] as List)
        ?.map((e) => e == null
            ? null
            : StacktraceItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BugsnagExceptionToJson(BugsnagException instance) =>
    <String, dynamic>{
      'error_class': instance.errorClass,
      'message': instance.message,
      'stacktrace': instance.stacktrace,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StacktraceItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacktraceItem _$StacktraceItemFromJson(Map<String, dynamic> json) {
  return StacktraceItem(
    lineNumber: json['lineNumber'] as int,
    file: json['file'] as String,
    method: json['method'] as String,
    code: (json['code'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as String),
    ),
  );
}

Map<String, dynamic> _$StacktraceItemToJson(StacktraceItem instance) =>
    <String, dynamic>{
      'lineNumber': instance.lineNumber,
      'file': instance.file,
      'method': instance.method,
      'code': instance.code?.map((k, e) => MapEntry(k.toString(), e)),
    };

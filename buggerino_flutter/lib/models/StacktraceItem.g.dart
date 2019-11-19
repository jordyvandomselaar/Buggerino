// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StacktraceItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacktraceItem _$StacktraceItemFromJson(Map<String, dynamic> json) {
  return StacktraceItem(
    lineNumber: json['line_number'] as int,
    columnNumber: json['column_number'] as int,
    file: json['file'] as String,
    method: json['method'] as String,
    code: (json['code'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(int.parse(k), e as String),
    ),
  );
}

Map<String, dynamic> _$StacktraceItemToJson(StacktraceItem instance) =>
    <String, dynamic>{
      'line_number': instance.lineNumber,
      'column_number': instance.columnNumber,
      'file': instance.file,
      'method': instance.method,
      'code': instance.code?.map((k, e) => MapEntry(k.toString(), e)),
    };

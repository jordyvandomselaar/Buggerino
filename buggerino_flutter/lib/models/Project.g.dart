// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return Project(
    name: json['name'] as String,
    errorsUrl: json['errors_url'] as String,
    openErrorCount: json['open_error_count'] as int,
  );
}

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'name': instance.name,
      'errors_url': instance.errorsUrl,
      'open_error_count': instance.openErrorCount,
    };

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part "Project.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class Project {
  final String name;
  final String errorsUrl;
  final int openErrorCount;

  Project({@required this.name, @required this.errorsUrl, @required this.openErrorCount});

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  toJson() => _$ProjectToJson(this);
}
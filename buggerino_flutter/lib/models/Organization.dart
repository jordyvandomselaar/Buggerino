import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part "Organization.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class Organization {
  final String name;
  final String projectsUrl;

  Organization({@required this.name, @required this.projectsUrl});

  factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);

  toJson() => _$OrganizationToJson(this);
}
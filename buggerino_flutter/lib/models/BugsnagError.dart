import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part "BugsnagError.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class BugsnagError {
  final String eventsUrl;
  final String errorClass;
  final String message;
  final int events;
  final String status;
  final DateTime lastSeen;

  BugsnagError(
      {@required this.eventsUrl,
      @required this.errorClass,
      @required this.message,
      @required this.events,
      @required this.status,
      @required this.lastSeen});

  factory BugsnagError.fromJson(Map<String, dynamic> json) => _$BugsnagErrorFromJson(json);

  toJson() => _$BugsnagErrorToJson(this);
}

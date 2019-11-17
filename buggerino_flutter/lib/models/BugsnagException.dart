import 'package:buggerino_flutter/models/StacktraceItem.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part "BugsnagException.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class BugsnagException {
  final String errorClass;
  final String message;
  final List<StacktraceItem> stacktrace;

  BugsnagException(
      {@required this.errorClass,
      @required this.message,
      @required this.stacktrace});

  factory BugsnagException.fromJson(Map<String, dynamic> json) => _$BugsnagExceptionFromJson(json);

  toJson() => _$BugsnagExceptionToJson(this);
}
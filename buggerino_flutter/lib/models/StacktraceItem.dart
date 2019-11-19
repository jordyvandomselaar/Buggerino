import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part "StacktraceItem.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class StacktraceItem {
  final int lineNumber;
  final int columnNumber;
  final String file;
  final String method;
  final Map<int, String> code;

  StacktraceItem(
      {@required this.lineNumber,
        @required this.columnNumber,
      @required this.file,
      @required this.method,
      @required this.code});
  
  toJson() => _$StacktraceItemToJson(this);
  
  factory StacktraceItem.fromJson(Map<String, dynamic> json) => _$StacktraceItemFromJson(json);
}
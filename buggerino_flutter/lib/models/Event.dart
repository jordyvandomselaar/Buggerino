import 'package:buggerino_flutter/models/BugsnagException.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part "Event.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class Event {
  final String url;
  final DateTime receivedAt;
  final List<BugsnagException> exceptions;
  final String context;

  Event({@required this.url, @required this.receivedAt, @required this.exceptions, @required this.context});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  toJson() => _$EventToJson(this);
}
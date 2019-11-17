import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part "User.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final String username;
  final String password;

  User({@required this.username, @required this.password});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable {
  final String username;

  @override
  List<Object> get props => [username];

  final String password;

  User({@required this.username, @required this.password});

  User.fromJson(Map<String, dynamic> json) : username = json["username"], password = json["password"];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}

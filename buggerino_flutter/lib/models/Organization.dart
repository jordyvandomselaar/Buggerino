import 'package:flutter/material.dart';

class Organization {
  final String name;
  final String projectsUrl;

  Organization({@required this.name, @required this.projectsUrl});

  Organization.fromJson(Map<String, dynamic> json) : name = json["name"], projectsUrl = json["projects_url"];
}
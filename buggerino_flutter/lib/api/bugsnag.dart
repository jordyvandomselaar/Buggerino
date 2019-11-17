import 'dart:convert';

import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Organization.dart';
import 'package:buggerino_flutter/models/Project.dart';
import 'package:buggerino_flutter/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class BugsnagClient {
  static User user;

  static String _getBasicAuthHeader() {
    return "Basic ${base64Encode(utf8.encode("${user.username}:${user.password}"))}";
  }

  static getOrganizations() async {
    final response = await get("https://api.bugsnag.com/user/organizations",
        headers: {"Authorization": _getBasicAuthHeader()});

    List<Organization> organizations = [];

    if (response.statusCode == 200) {
      organizations = (jsonDecode(response.body) as List)
          .map((data) => Organization.fromJson(data))
          .toList();
    }

    return organizations;
  }

  static getProjects({@required Organization organization}) async {
    final response = await get(organization.projectsUrl,
        headers: {"Authorization": _getBasicAuthHeader()});

    List<Project> projects = [];

    if (response.statusCode == 200) {
      projects = (jsonDecode(response.body) as List)
          .map((data) => Project.fromJson(data))
          .toList();
    }

    return projects;
  }

  static getErrors({@required Project project}) async {
    final response = await get(project.errorsUrl,
        headers: {"Authorization": _getBasicAuthHeader()});

    List<BugsnagError> errors = [];

    if(response.statusCode == 200) {
      errors = (jsonDecode(response.body) as List)
          .map((data) => BugsnagError.fromJson(data))
          .toList();
    }

    return errors;
  }
}

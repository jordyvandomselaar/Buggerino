import 'dart:convert';

import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Event.dart';
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

  static Future<List<Organization>> getOrganizations() async {
    final response = await get("https://api.bugsnag.com/user/organizations",
        headers: {"Authorization": _getBasicAuthHeader()});

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((data) => Organization.fromJson(data))
          .toList();
    }

    return [];
  }

   static Future<List<Project>> getProjects({@required Organization organization}) async {
    final response = await get(organization.projectsUrl,
        headers: {"Authorization": _getBasicAuthHeader()});

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((data) => Project.fromJson(data))
          .toList();
    }

    return [];
  }

  static Future<List<BugsnagError>> getErrors({@required Project project}) async {
    final response = await get(project.errorsUrl,
        headers: {"Authorization": _getBasicAuthHeader()});

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((data) => BugsnagError.fromJson(data))
          .toList();
    }

    return [];
  }

  static Future<List<Event>> getEvents({@required BugsnagError error}) async {
    final response = await get(error.eventsUrl,
        headers: {"Authorization": _getBasicAuthHeader()});

    if(response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((data) => Event.fromJson(data))
          .toList();
    }

    return [];
  }

  static Future<Event> getEvent({@required Event event}) async {
    final response = await get(event.url,
        headers: {"Authorization": _getBasicAuthHeader()});

    if(response.statusCode == 200) {
      return Event.fromJson(jsonDecode(response.body));
    }

    if(response.statusCode == 429) {
      final int retryAfter = int.parse(response.headers["retry-after"]);

      await Future.delayed(Duration(seconds: retryAfter + 1));

      return getEvent(event: event);
    }

    return null;
  }
}

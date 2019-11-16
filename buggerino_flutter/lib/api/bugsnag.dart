import 'dart:convert';

import 'package:buggerino_flutter/models/Organization.dart';
import 'package:buggerino_flutter/models/User.dart';
import 'package:http/http.dart';

class BugsnagClient {
  static User user;

  static String _getBasicAuthHeader() {
    return "Basic ${base64Encode(utf8.encode("${user.username}:${user.password}"))}";
  }

  static getOrganizations() async {
    Response response = await get("https://api.bugsnag.com/user/organizations", headers: {
      "Authorization": _getBasicAuthHeader()
    });

    List<Organization> organizations = [];

    if(response.statusCode == 200) {
      organizations = (jsonDecode(response.body) as List).map((data) => Organization.fromJson(data)).toList();
    }

    return organizations;
  }
}
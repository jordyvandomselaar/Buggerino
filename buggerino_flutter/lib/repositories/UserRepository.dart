import 'dart:convert';

import 'package:buggerino_flutter/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keychain/flutter_keychain.dart';

class UserRepository {
  Future<User> saveUser({
    @required User user
  }) async {
    await FlutterKeychain.put(key: "user", value: jsonEncode(user.toJson()));

    return user;
  }

  Future<User> getUser() async {
    String userData = await FlutterKeychain.get(key: "user");

    if(userData == null) {
      return null;
    }

    final user = User.fromJson(jsonDecode(userData));

    return user;
  }

  Future<void> deleteUser() async {
    FlutterKeychain.remove(key: "user");
  }
}

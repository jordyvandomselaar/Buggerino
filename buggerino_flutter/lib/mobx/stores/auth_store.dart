import 'package:buggerino_flutter/models/User.dart';
import 'package:buggerino_flutter/repositories/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final UserRepository userRepository = UserRepository();

  @observable
  User user;

  @observable
  bool loading = false;

  @action
  Future<void> loadUser() async {
    this.loading = true;
    this.user = await this.userRepository.getUser();
    this.loading = false;
  }

  @action
  Future<void> login({@required User user}) async {
    this.loading = true;
    this.user = await this.userRepository.saveUser(user: user);
    this.loading = false;
  }
}

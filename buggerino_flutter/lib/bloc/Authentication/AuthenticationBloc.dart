import 'package:bloc/bloc.dart';
import 'package:buggerino_flutter/api/bugsnag.dart';
import 'package:buggerino_flutter/bloc/Organizations/organizations_bloc.dart';
import 'package:buggerino_flutter/bloc/Organizations/organizations_event.dart';
import 'package:buggerino_flutter/repositories/UserRepository.dart';
import 'package:flutter/material.dart';
import 'AuthenticationEvent.dart';
import 'AuthenticationState.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  final OrganizationsBloc organizationsBloc;

  AuthenticationBloc({@required this.userRepository, @required this.organizationsBloc})
      : assert(userRepository != null), assert(organizationsBloc != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final user = await this.userRepository.getUser();

      if (user == null) {
        yield new AuthenticationUnauthenticated();
      } else {
        BugsnagClient.user = user;

        this.organizationsBloc.add(LoadOrganizations());

        yield new AuthenticationAuthenticated();
      }
    }

    if (event is LoggedIn) {
      yield new AuthenticationLoading();

      await userRepository.saveUser(user: event.user);

      BugsnagClient.user = event.user;

      this.organizationsBloc.add(LoadOrganizations());

      yield new AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield new AuthenticationLoading();

      await userRepository.deleteUser();

      yield new AuthenticationUnauthenticated();
    }
  }
}

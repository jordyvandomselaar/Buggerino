import 'package:bloc/bloc.dart';
import 'package:buggerino_flutter/bloc/Authentication/AuthenticationState.dart';
import 'package:buggerino_flutter/bloc/Organizations/organizations_bloc.dart';
import 'package:buggerino_flutter/components/LoginPage.dart';
import 'package:buggerino_flutter/components/SelectOrganizationPage.dart';
import 'package:buggerino_flutter/components/SelectProjectPage.dart';
import 'package:buggerino_flutter/components/SplashScreen.dart';
import 'package:buggerino_flutter/repositories/UserRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/Authentication/AuthenticationBloc.dart';
import 'bloc/Authentication/AuthenticationEvent.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<OrganizationsBloc>(
          builder: (context) => OrganizationsBloc(),
        ),
        BlocProvider<AuthenticationBloc>(
          builder: (context) => AuthenticationBloc(
            userRepository: userRepository,
            organizationsBloc: BlocProvider.of<OrganizationsBloc>(context)
          )..add(AppStarted()),
        )
      ],
      child: App(),
    )
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/projects": (context) => SelectProjectPage()
      },
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUninitialized) {
            return SplashScreen();
          }

          if (state is AuthenticationUnauthenticated) {
            return LoginPage();
          }

          return BlocProvider<OrganizationsBloc>(
            child: SelectOrganizationPage(),
            builder: (context) => OrganizationsBloc(),
          );
        },
      ),
    );
  }
}

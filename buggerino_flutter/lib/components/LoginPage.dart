import 'dart:convert';

import 'package:buggerino_flutter/bloc/Authentication/AuthenticationBloc.dart';
import 'package:buggerino_flutter/bloc/Authentication/AuthenticationEvent.dart';
import 'package:buggerino_flutter/components/LoginForm.dart';
import 'package:buggerino_flutter/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  void handleLogin(User user, BuildContext context) async {
    BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn(user: user));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (BuildContext context) {
        return Container(
            constraints: BoxConstraints.expand(),
            color: Colors.lightBlue,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Welcome to Buggerino!",
                      style: TextStyle(fontSize: 60, color: Colors.white)),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text(
                        "Please enter your Bugsnag credentials to get started.",
                        style: Theme.of(context).primaryTextTheme.title),
                  ),
                  LoginForm(
                    onSubmit: (user) => handleLogin(user, context),
                  )
                ],
              ),
            ));
      },
    ));
  }
}

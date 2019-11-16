import 'package:buggerino_flutter/bloc/Authentication/AuthenticationBloc.dart';
import 'package:buggerino_flutter/bloc/Authentication/AuthenticationState.dart';
import 'package:buggerino_flutter/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  final void Function(User) onSubmit;
  final _usernameController  = TextEditingController();
  final _passwordController  = TextEditingController();

   LoginForm({this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: "Username",
              labelStyle: Theme.of(context).primaryTextTheme.body1,
            ),
            style: Theme.of(context).primaryTextTheme.body1,
          ),
          TextFormField(
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: "Password",
              labelStyle: Theme.of(context).primaryTextTheme.body1,
            ),
            style: Theme.of(context).primaryTextTheme.body1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: double.infinity,
              child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return RaisedButton(
                    child: state is AuthenticationLoading ? CircularProgressIndicator() : Text("Login"),
                    onPressed: () {
                      final user = User(
                          username: _usernameController.value.text,
                          password: _passwordController.value.text
                      );

                      onSubmit(user);
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

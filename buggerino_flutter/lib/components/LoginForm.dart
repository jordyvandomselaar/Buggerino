import 'package:buggerino_flutter/mobx/stores/auth_store.dart';
import 'package:buggerino_flutter/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginForm extends StatelessWidget {
  final void Function(User) onSubmit;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthStore authStore;

  LoginForm({@required this.onSubmit, @required this.authStore});

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
              child: Observer(
                builder: (_) {
                  return RaisedButton(
                    child: this.authStore.loading == true
                        ? CircularProgressIndicator()
                        : Text("Login"),
                    onPressed: () {
                      final user = User(
                          username: _usernameController.value.text,
                          password: _passwordController.value.text);

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

import 'package:buggerino_flutter/api/bugsnag.dart';
import 'package:buggerino_flutter/components/EventSelectedPage.dart';
import 'package:buggerino_flutter/components/LoginPage.dart';
import 'package:buggerino_flutter/components/SelectErrorPage.dart';
import 'package:buggerino_flutter/components/SelectEventPage.dart';
import 'package:buggerino_flutter/components/SelectOrganizationPage.dart';
import 'package:buggerino_flutter/components/SelectProjectPage.dart';
import 'package:buggerino_flutter/mobx/stores/auth_store.dart';
import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Organization.dart';
import 'package:buggerino_flutter/models/Project.dart';
import 'package:buggerino_flutter/view_models/event_selected_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final AuthStore authStore = AuthStore();
  ReactionDisposer _disposer;

  _AppState() {
    this._disposer = autorun((_) {
      BugsnagClient.user = this.authStore.user;
    });
  }

  @override
  void initState() {
    super.initState();
    this.authStore.loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryTextTheme:
        TextTheme(title: TextStyle(fontSize: 20, color: Colors.black87)),
      ),
      home: Observer(builder: (_) {
        if (this.authStore.loading || this.authStore.user == null ||
            this.authStore.user.username == '') {
          return LoginPage(authStore: this.authStore);
        }

        return SelectOrganizationPage();
      }),
      onGenerateRoute: (settings) {
        final arguments = settings.arguments;

        switch (settings.name) {
          case "/projects":
            final organization = arguments as Organization;
            return MaterialPageRoute(
                builder: (context) =>
                    SelectProjectPage(
                      organization: organization,
                    ));
          case "/errors":
            final project = arguments as Project;
            return MaterialPageRoute(
                builder: (context) => SelectErrorPage(project: project));
          case "/events":
            final error = arguments as BugsnagError;
            return MaterialPageRoute(
                builder: (context) =>
                    SelectEventPage(
                      error: error,
                    ));
          case "/event":
            final selectedEventViewModel = arguments as EventSelectedViewModel;
            return MaterialPageRoute(
                builder: (context) =>
                    EventSelectedPage(
                        eventSelectedViewModel: selectedEventViewModel));

          default:
            return null;
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    this._disposer();
  }
}

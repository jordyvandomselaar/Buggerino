import 'package:buggerino_flutter/components/SelectPage.dart';
import 'package:buggerino_flutter/mobx/stores/errors_store.dart';
import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SelectErrorPage extends StatelessWidget {
  final Project project;
  final ErrorsStore errorsStore = ErrorsStore();

  SelectErrorPage({Key key, @required this.project})
      : super(key: key) {
    this.errorsStore.loadErrors(project: project);
  }

  void selectError(
      {@required BugsnagError error, @required BuildContext context}) {
    Navigator.of(context).pushNamed("/events", arguments: error);
  }

  @override
  Widget build(BuildContext context) {
    return SelectPage(
      title: this.project.name,
      children: [
        Observer(
          builder: (_) {
            if (this.errorsStore.loading == true) {
              return SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text("Loading…")],
                  )
                ]),
              );
            }

            if (this.errorsStore.errors.length == 0) {
              return SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text("No errors found 🎉️")],
                  )
                ]),
              );
            }

            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ListTile(
                  title: Text(this.errorsStore.errors[index].errorClass),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(this.errorsStore.errors[index].message,
                          overflow: TextOverflow.ellipsis, maxLines: 1),
                      Text(this
                          .errorsStore
                          .errors[index]
                          .lastSeen
                          .toLocal()
                          .toString()),
                    ],
                  ),
                  trailing:
                  Text(this.errorsStore.errors[index].events.toString()),
                  onTap: () =>
                      this.selectError(
                          error: this.errorsStore.errors[index],
                          context: context),
                );
              }, childCount: this.errorsStore.errors.length),
            );
          },
        )
      ],
    );
  }
}

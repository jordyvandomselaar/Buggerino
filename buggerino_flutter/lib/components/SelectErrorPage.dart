import 'package:buggerino_flutter/api/bugsnag.dart';
import 'package:buggerino_flutter/bloc/Errors/errors_bloc.dart';
import 'package:buggerino_flutter/bloc/Errors/errors_event.dart';
import 'package:buggerino_flutter/bloc/Errors/errors_state.dart';
import 'package:buggerino_flutter/components/SelectPage.dart';
import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SelectErrorPage extends StatelessWidget {
  final Project project;
  final ErrorsBloc errorsBloc;

  SelectErrorPage({Key key, @required this.project, @required this.errorsBloc}) : super(key: key) {
    this.errorsBloc.add(LoadErrors(project: this.project));
  }

  @override
  Widget build(BuildContext context) {
    return SelectPage(
      title: this.project.name,
      child: BlocBuilder<ErrorsBloc, ErrorsState>(
        builder: (context, state) {
          if (state is ErrorsLoadingState) {
            return SliverList(
              delegate: SliverChildListDelegate(
                [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Loading…")
                    ],
                  )
                ]
              ),
            );
          }

          if (state is ErrorsLoadedState) {
            if(state.errors.length == 0) {
              return SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("No errors found 🎉️")
                    ],
                  )
                ]),
              );
            }


            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ListTile(
                  title: Text(state.errors[index].errorClass),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(state.errors[index].message, overflow: TextOverflow.ellipsis, maxLines: 1),
                      Text(state.errors[index].lastSeen.toLocal().toString()),
                    ],
                  ),
                  trailing: Text(state.errors[index].events.toString()),
//            onTap: () => this.selectOrganization(state.organizations[index], context),
                );
              }, childCount: state.errors.length),
            );
          }
          return SliverList(
            delegate: SliverChildListDelegate([Text("Something went wrong, please go back and select this project again")]),
          );
        },
      ),
    );
  }
}

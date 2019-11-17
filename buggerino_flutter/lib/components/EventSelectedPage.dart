import 'package:buggerino_flutter/bloc/Events/bloc.dart';
import 'package:buggerino_flutter/components/FlexibleSpaceBar.dart' as prefix0;
import 'package:buggerino_flutter/components/SelectPage.dart';
import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventSelectedPage extends StatelessWidget {
  final Event event;
  final BugsnagError error;
  final EventBloc eventBloc;

  EventSelectedPage(
      {Key key,
      @required this.event,
      @required this.error,
      @required this.eventBloc})
      : super(key: key) {
    this.eventBloc.add(SelectEvent(event: this.event, error: this.error));
  }

  @override
  Widget build(BuildContext context) {
    return SelectPage(
      title: this.error.message,
      child: BlocBuilder<EventBloc, EventState>(
        builder: (context, state) {
          if (state is EventSelectedLoadingState) {
            return SliverList(
              delegate: SliverChildListDelegate([Text("Loading…")]),
            );
          }

          if (state is EventSelectedLoadedState) {
            return SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text(this.error.errorClass),
                      title: ,
                    )
                  ],
                )
              ]),
            );
          }

          return SliverList(
            delegate: SliverChildListDelegate(
                [Text("Something went wrong, please restart app")]),
          );
        },
      ),
    );
  }
}

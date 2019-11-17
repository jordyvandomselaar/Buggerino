import 'package:buggerino_flutter/bloc/Events/bloc.dart';
import 'package:buggerino_flutter/components/SelectPage.dart';
import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Event.dart';
import 'package:buggerino_flutter/view_models/event_selected_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectEventPage extends StatelessWidget {
  final BugsnagError error;
  final EventBloc eventBloc;

  SelectEventPage({Key key, @required this.error, @required this.eventBloc})
      : super(key: key) {
    this.eventBloc.add(LoadEvents(error: this.error));
  }

  void selectEvent(Event event, BuildContext context) {
    Navigator.of(context).pushNamed("/event", arguments: EventSelectedViewModel(
      error: this.error,
      event: event
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SelectPage(
      title: this.error.message,
      child: BlocBuilder<EventBloc, EventState>(
        builder: (context, state) {
          if (state is EventsLoadingState) {
            return SliverList(
              delegate: SliverChildListDelegate([Text("Loading…")]),
            );
          }

          if (state is EventsLoadedState) {
            if (state.events.length == 0) {
              return SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text("No events found…️")],
                  )
                ]),
              );
            }

            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ListTile(
                  title: Text(this.error.errorClass),
                  subtitle: Text(this.error.message,
                      overflow: TextOverflow.ellipsis, maxLines: 1),
                  trailing: Text(
                      state.events[index].receivedAt.toLocal().toString()),
            onTap: () => this.selectEvent(state.events[index], context),
                );
              }, childCount: state.events.length),
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

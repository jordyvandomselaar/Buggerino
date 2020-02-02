import 'package:buggerino_flutter/components/SelectPage.dart';
import 'package:buggerino_flutter/mobx/stores/events_store.dart';
import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Event.dart';
import 'package:buggerino_flutter/view_models/event_selected_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SelectEventPage extends StatelessWidget {
  final BugsnagError error;
  final EventsStore eventsStore = EventsStore();

  SelectEventPage({Key key, @required this.error})
      : super(key: key) {
    this.eventsStore.loadEvents(error: this.error);
  }

  void selectEvent(Event event, BuildContext context) {
    Navigator.of(context).pushNamed("/event",
        arguments: EventSelectedViewModel(error: this.error, event: event));
  }

  @override
  Widget build(BuildContext context) {
    return SelectPage(
      title: this.error.message,
      children: [
        Observer(
          builder: (_) {
            if (this.eventsStore.loading == true) {
              return SliverList(
                delegate: SliverChildListDelegate([Text("Loading…")]),
              );
            }

            if (this.eventsStore.events.length == 0) {
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
                  title: Text(
                      "${this.error.errorClass} ${this.eventsStore.events[index]
                          .context}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  subtitle: Text(this.error.message,
                      overflow: TextOverflow.ellipsis, maxLines: 1),
                  trailing: Text(this
                      .eventsStore
                      .events[index]
                      .receivedAt
                      .toLocal()
                      .toString()),
                  onTap: () =>
                      this.selectEvent(this.eventsStore.events[index], context),
                );
              }, childCount: this.eventsStore.events.length),
            );
          },
        )
      ],
    );
  }
}

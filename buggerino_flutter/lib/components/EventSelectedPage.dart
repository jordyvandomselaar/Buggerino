import 'package:buggerino_flutter/components/SelectPage.dart';
import 'package:buggerino_flutter/mobx/stores/events_store.dart';
import 'package:buggerino_flutter/view_models/event_selected_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class EventSelectedPage extends StatelessWidget {
  final EventSelectedViewModel eventSelectedViewModel;
  final EventsStore eventsStore = EventsStore();

  EventSelectedPage({Key key, @required this.eventSelectedViewModel})
      : super(key: key) {
    this.eventsStore.selectEvent(event: this.eventSelectedViewModel.event);
  }

  @override
  Widget build(BuildContext context) {
    return SelectPage(
      title: this.eventSelectedViewModel.error.message,
      children: [
        Observer(
          builder: (_) {
            if (this.eventsStore.loading == true) {
              return SliverList(
                delegate: SliverChildListDelegate([Text("Loading…")]),
              );
            }

            return SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: <Widget>[
                    Text(
                      "${this.eventSelectedViewModel.error.errorClass} ${this
                          .eventsStore.selectedEvent.context}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    ...this
                        .eventsStore
                        .selectedEvent
                        .exceptions
                        .map((exception) {
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(exception.message),
                          ),
                          ...exception.stacktrace.map((stacktraceItem) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      "${stacktraceItem.file}   ${stacktraceItem
                                          .lineNumber}:${stacktraceItem
                                          .columnNumber}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  ...(stacktraceItem.code != null
                                      ? (stacktraceItem.code.keys
                                      .map((codeLine) {
                                    return Text(
                                      "${codeLine.toString()}   ${stacktraceItem
                                          .code[codeLine]}",
                                    );
                                  }))
                                      : [])
                                ],
                              ),
                            );
                          })
                        ],
                      );
                    })
                  ],
                )
              ]),
            );
          },
        )
      ],
    );
  }
}

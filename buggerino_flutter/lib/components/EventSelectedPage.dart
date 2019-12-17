import 'package:buggerino_flutter/bloc/SelectedEvent/bloc.dart';
import 'package:buggerino_flutter/components/SelectPage.dart';
import 'package:buggerino_flutter/view_models/event_selected_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventSelectedPage extends StatelessWidget {
  final EventSelectedViewModel eventSelectedViewModel;
  final SelectedEventBloc selectedEventBloc;

  EventSelectedPage(
      {Key key,
      @required this.eventSelectedViewModel,
      @required this.selectedEventBloc})
      : super(key: key) {
    this.selectedEventBloc.add(LoadEvent(
        event: this.eventSelectedViewModel.event,
        error: this.eventSelectedViewModel.error));
  }

  @override
  Widget build(BuildContext context) {
    return SelectPage(
      title: this.eventSelectedViewModel.error.message,
      children: [
        BlocBuilder<SelectedEventBloc, SelectedEventState>(
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
                      Text(
                        "${state.error.errorClass} ${state.event.context}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      ...state.event.exceptions.map((exception) {
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
                                  crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 20),
                                      child: Text(
                                        "${stacktraceItem
                                            .file}   ${stacktraceItem
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
                                        "${codeLine
                                            .toString()}   ${stacktraceItem
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
            }

            return SliverList(
              delegate: SliverChildListDelegate(
                  [Text("Something went wrong, please restart app")]),
            );
          },
        )
      ],
    );
  }
}

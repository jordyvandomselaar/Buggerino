import 'package:buggerino_flutter/api/bugsnag.dart';
import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Event.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'events_store.g.dart';

class EventsStore = _EventsStore with _$EventsStore;

abstract class _EventsStore with Store {
  @observable
  ObservableList<Event> events = ObservableList();

  @observable
  bool loading = false;

  @action
  Future<void> loadEvents({@required BugsnagError error}) async {
    this.loading = true;
    this.events =
        ObservableList.of(await BugsnagClient.getEvents(error: error));
    this.loading = false;
  }
}

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
  Event selectedEvent;

  @observable
  bool loading = false;

  @action
  Future<void> loadEvents({@required BugsnagError error}) async {
    this.loading = true;
    this.events =
        ObservableList.of(await BugsnagClient.getEvents(error: error));
    this.loading = false;
  }

  @action
  Future<void> selectEvent({@required Event event }) async {
    this.loading = true;
    this.selectedEvent = await BugsnagClient.getEvent(event: event);
    this.loading = false;
  }
}

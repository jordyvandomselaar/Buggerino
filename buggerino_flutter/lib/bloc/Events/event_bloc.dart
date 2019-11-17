import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:buggerino_flutter/api/bugsnag.dart';
import './bloc.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  @override
  EventState get initialState => InitialEventState();

  @override
  Stream<EventState> mapEventToState(
    EventEvent event,
  ) async* {
    if(event is LoadEvents) {
      yield (EventsLoadingState());
      final events = await BugsnagClient.getEvents(error: event.error);
      yield (EventsLoadedState(events: events));
    }

    if(event is SelectEvent) {
      yield (EventSelectedLoadingState());
      final selectedEvent = await BugsnagClient.getEvent(event: event.event);
      yield (EventSelectedLoadedState(event: selectedEvent, error: event.error));
    }
  }
}

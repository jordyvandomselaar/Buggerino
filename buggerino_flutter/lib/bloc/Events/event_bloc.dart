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

    }
  }
}

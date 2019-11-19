import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:buggerino_flutter/api/bugsnag.dart';
import './bloc.dart';

class SelectedEventBloc extends Bloc<SelectedEventEvent, SelectedEventState> {
  @override
  SelectedEventState get initialState => InitialSelectedEventState();

  @override
  Stream<SelectedEventState> mapEventToState(
    SelectedEventEvent event,
  ) async* {
    if(event is LoadEvent) {
      yield (EventSelectedLoadingState());
      final selectedEvent = await BugsnagClient.getEvent(event: event.event);
      yield (EventSelectedLoadedState(event: selectedEvent, error: event.error));
    }
  }
}

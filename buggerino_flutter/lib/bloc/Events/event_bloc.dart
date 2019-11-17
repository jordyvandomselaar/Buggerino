import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  @override
  EventState get initialState => InitialEventState();

  @override
  Stream<EventState> mapEventToState(
    EventEvent event,
  ) async* {
    // TODO: Add Logic
  }
}

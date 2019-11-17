import 'package:equatable/equatable.dart';

abstract class EventState extends Equatable {
  const EventState();
}

class InitialEventState extends EventState {
  @override
  List<Object> get props => [];
}

class EventsLoadingState extends EventState {
  @override
  List<Object> get props => [];
}

class EventsLoadedState extends EventState {


  @override
  List<Object> get props => [];
}
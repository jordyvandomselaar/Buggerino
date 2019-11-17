import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
  final List<Event> events;

  EventsLoadedState({@required this.events});

  @override
  List<Object> get props => [];
}

class EventSelectedLoadingState extends EventState {
  @override
  List<Object> get props => [];
}

class EventSelectedLoadedState extends EventState {
  final Event event;
  final BugsnagError error;

  EventSelectedLoadedState({@required this.event, @required this.error});

  @override
  List<Object> get props => [];
}
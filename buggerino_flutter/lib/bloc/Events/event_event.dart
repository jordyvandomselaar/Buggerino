import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();
}

class LoadEvents extends EventEvent {
  final BugsnagError error;

  LoadEvents({@required this.error});

  @override
  List<Object> get props => [];
}

class SelectEvent extends EventEvent {
  final Event event;
  final BugsnagError error;

  SelectEvent({@required this.event, @required this.error});

  @override
  List<Object> get props => [];
}

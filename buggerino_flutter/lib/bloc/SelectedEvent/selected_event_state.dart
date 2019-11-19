import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SelectedEventState extends Equatable {
  const SelectedEventState();
}

class InitialSelectedEventState extends SelectedEventState {
  @override
  List<Object> get props => [];
}

class EventSelectedLoadingState extends SelectedEventState {
  @override
  List<Object> get props => [];
}

class EventSelectedLoadedState extends SelectedEventState {
  final Event event;
  final BugsnagError error;

  EventSelectedLoadedState({@required this.event, @required this.error});

  @override
  List<Object> get props => [];
}
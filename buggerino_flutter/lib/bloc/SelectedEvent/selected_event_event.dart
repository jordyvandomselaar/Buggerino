import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SelectedEventEvent extends Equatable {
  const SelectedEventEvent();
}

class LoadEvent extends SelectedEventEvent {
  final Event event;
  final BugsnagError error;

  LoadEvent({@required this.event, @required this.error});

  @override
  List<Object> get props => [];
}

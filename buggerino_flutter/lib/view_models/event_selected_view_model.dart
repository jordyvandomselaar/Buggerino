import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Event.dart';
import 'package:flutter/material.dart';

class EventSelectedViewModel {
  final Event event;
  final BugsnagError error;

  EventSelectedViewModel({@required this.event, @required this.error});
}

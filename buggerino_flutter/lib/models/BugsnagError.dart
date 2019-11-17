import 'package:flutter/material.dart';

class BugsnagError {
  final String eventsUrl;
  final String errorClass;
  final String message;
  final int events;
  final String status;
  final DateTime lastSeen;

  BugsnagError(
      {@required this.eventsUrl,
      @required this.errorClass,
      @required this.message,
      @required this.events,
      @required this.status,
      @required this.lastSeen});

  BugsnagError.fromJson(Map<String, dynamic> json)
      : eventsUrl = json["events_url"],
        errorClass = json["error_class"],
        message = json["message"],
        events = json["events"],
        status = json["status"],
        lastSeen = DateTime.parse(json["last_seen"]);
}

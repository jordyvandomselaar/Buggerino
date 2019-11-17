import 'package:buggerino_flutter/models/Project.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ErrorsEvent extends Equatable {
  const ErrorsEvent();
}

class LoadErrors extends ErrorsEvent {
  final Project project;

  LoadErrors({ @required this.project });

  @override
  List<Object> get props => [];
}

import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ErrorsState extends Equatable {
  const ErrorsState();
}

class InitialErrorsState extends ErrorsState {
  @override
  List<Object> get props => [];
}

class ErrorsLoadingState extends ErrorsState {

  @override
  List<Object> get props => [];
}

class ErrorsLoadedState extends ErrorsState {
  final List<BugsnagError> errors;

  @override
  List<Object> get props => [];

  ErrorsLoadedState({@required this.errors});
}
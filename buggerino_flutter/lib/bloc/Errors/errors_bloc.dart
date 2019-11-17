import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:buggerino_flutter/api/bugsnag.dart';
import './bloc.dart';

class ErrorsBloc extends Bloc<ErrorsEvent, ErrorsState> {
  @override
  ErrorsState get initialState => InitialErrorsState();

  @override
  Stream<ErrorsState> mapEventToState(
    ErrorsEvent event,
  ) async* {
    if(event is LoadErrors) {
      yield ErrorsLoadingState();

      final errors = await BugsnagClient.getErrors(project: event.project);

      yield ErrorsLoadedState(errors: errors);
    }
  }
}

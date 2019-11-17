import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class SelectedEventBloc extends Bloc<SelectedEventEvent, SelectedEventState> {
  @override
  SelectedEventState get initialState => InitialSelectedEventState();

  @override
  Stream<SelectedEventState> mapEventToState(
    SelectedEventEvent event,
  ) async* {
    // TODO: Add Logic
  }
}

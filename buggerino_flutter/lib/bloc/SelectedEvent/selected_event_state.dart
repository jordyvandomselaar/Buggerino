import 'package:equatable/equatable.dart';

abstract class SelectedEventState extends Equatable {
  const SelectedEventState();
}

class InitialSelectedEventState extends SelectedEventState {
  @override
  List<Object> get props => [];
}

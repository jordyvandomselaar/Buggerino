// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventsStore on _EventsStore, Store {
  final _$eventsAtom = Atom(name: '_EventsStore.events');

  @override
  ObservableList<Event> get events {
    _$eventsAtom.context.enforceReadPolicy(_$eventsAtom);
    _$eventsAtom.reportObserved();
    return super.events;
  }

  @override
  set events(ObservableList<Event> value) {
    _$eventsAtom.context.conditionallyRunInAction(() {
      super.events = value;
      _$eventsAtom.reportChanged();
    }, _$eventsAtom, name: '${_$eventsAtom.name}_set');
  }

  final _$selectedEventAtom = Atom(name: '_EventsStore.selectedEvent');

  @override
  Event get selectedEvent {
    _$selectedEventAtom.context.enforceReadPolicy(_$selectedEventAtom);
    _$selectedEventAtom.reportObserved();
    return super.selectedEvent;
  }

  @override
  set selectedEvent(Event value) {
    _$selectedEventAtom.context.conditionallyRunInAction(() {
      super.selectedEvent = value;
      _$selectedEventAtom.reportChanged();
    }, _$selectedEventAtom, name: '${_$selectedEventAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_EventsStore.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$loadEventsAsyncAction = AsyncAction('loadEvents');

  @override
  Future<void> loadEvents({@required BugsnagError error}) {
    return _$loadEventsAsyncAction.run(() => super.loadEvents(error: error));
  }

  final _$selectEventAsyncAction = AsyncAction('selectEvent');

  @override
  Future<void> selectEvent({@required Event event}) {
    return _$selectEventAsyncAction.run(() => super.selectEvent(event: event));
  }
}

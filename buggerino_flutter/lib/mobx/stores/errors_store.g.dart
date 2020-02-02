// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ErrorsStore on _ErrorsStore, Store {
  final _$errorsAtom = Atom(name: '_ErrorsStore.errors');

  @override
  ObservableList<BugsnagError> get errors {
    _$errorsAtom.context.enforceReadPolicy(_$errorsAtom);
    _$errorsAtom.reportObserved();
    return super.errors;
  }

  @override
  set errors(ObservableList<BugsnagError> value) {
    _$errorsAtom.context.conditionallyRunInAction(() {
      super.errors = value;
      _$errorsAtom.reportChanged();
    }, _$errorsAtom, name: '${_$errorsAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_ErrorsStore.loading');

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

  final _$loadErrorsAsyncAction = AsyncAction('loadErrors');

  @override
  Future<void> loadErrors({@required Project project}) {
    return _$loadErrorsAsyncAction
        .run(() => super.loadErrors(project: project));
  }
}

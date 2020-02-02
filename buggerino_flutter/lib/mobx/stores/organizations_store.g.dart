// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizations_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OrganizationsStore on _OrganizationsStore, Store {
  final _$organizationsAtom = Atom(name: '_OrganizationsStore.organizations');

  @override
  ObservableList<Organization> get organizations {
    _$organizationsAtom.context.enforceReadPolicy(_$organizationsAtom);
    _$organizationsAtom.reportObserved();
    return super.organizations;
  }

  @override
  set organizations(ObservableList<Organization> value) {
    _$organizationsAtom.context.conditionallyRunInAction(() {
      super.organizations = value;
      _$organizationsAtom.reportChanged();
    }, _$organizationsAtom, name: '${_$organizationsAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_OrganizationsStore.loading');

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

  final _$loadOrganizationsAsyncAction = AsyncAction('loadOrganizations');

  @override
  Future<void> loadOrganizations() {
    return _$loadOrganizationsAsyncAction.run(() => super.loadOrganizations());
  }
}

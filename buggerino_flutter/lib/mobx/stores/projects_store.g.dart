// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectsStore on _ProjectsStore, Store {
  Computed<List<Project>> _$projectsComputed;

  @override
  List<Project> get projects =>
      (_$projectsComputed ??= Computed<List<Project>>(() => super.projects))
          .value;

  final _$_projectsAtom = Atom(name: '_ProjectsStore._projects');

  @override
  ObservableList<Project> get _projects {
    _$_projectsAtom.context.enforceReadPolicy(_$_projectsAtom);
    _$_projectsAtom.reportObserved();
    return super._projects;
  }

  @override
  set _projects(ObservableList<Project> value) {
    _$_projectsAtom.context.conditionallyRunInAction(() {
      super._projects = value;
      _$_projectsAtom.reportChanged();
    }, _$_projectsAtom, name: '${_$_projectsAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_ProjectsStore.loading');

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

  final _$_searchAtom = Atom(name: '_ProjectsStore._search');

  @override
  String get _search {
    _$_searchAtom.context.enforceReadPolicy(_$_searchAtom);
    _$_searchAtom.reportObserved();
    return super._search;
  }

  @override
  set _search(String value) {
    _$_searchAtom.context.conditionallyRunInAction(() {
      super._search = value;
      _$_searchAtom.reportChanged();
    }, _$_searchAtom, name: '${_$_searchAtom.name}_set');
  }

  final _$loadProjectsAsyncAction = AsyncAction('loadProjects');

  @override
  Future<void> loadProjects({@required Organization organization}) {
    return _$loadProjectsAsyncAction
        .run(() => super.loadProjects(organization: organization));
  }

  final _$_ProjectsStoreActionController =
  ActionController(name: '_ProjectsStore');

  @override
  void search({@required String value}) {
    final _$actionInfo = _$_ProjectsStoreActionController.startAction();
    try {
      return super.search(value: value);
    } finally {
      _$_ProjectsStoreActionController.endAction(_$actionInfo);
    }
  }
}

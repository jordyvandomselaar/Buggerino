// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectsStore on _ProjectsStore, Store {
  final _$projectsAtom = Atom(name: '_ProjectsStore.projects');

  @override
  ObservableList<Project> get projects {
    _$projectsAtom.context.enforceReadPolicy(_$projectsAtom);
    _$projectsAtom.reportObserved();
    return super.projects;
  }

  @override
  set projects(ObservableList<Project> value) {
    _$projectsAtom.context.conditionallyRunInAction(() {
      super.projects = value;
      _$projectsAtom.reportChanged();
    }, _$projectsAtom, name: '${_$projectsAtom.name}_set');
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

  final _$loadProjectsAsyncAction = AsyncAction('loadProjects');

  @override
  Future<void> loadProjects({@required Organization organization}) {
    return _$loadProjectsAsyncAction
        .run(() => super.loadProjects(organization: organization));
  }
}
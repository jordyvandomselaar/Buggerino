import 'package:buggerino_flutter/api/bugsnag.dart';
import 'package:buggerino_flutter/models/Organization.dart';
import 'package:buggerino_flutter/models/Project.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'projects_store.g.dart';

class ProjectsStore = _ProjectsStore with _$ProjectsStore;

abstract class _ProjectsStore with Store {
  @observable
  ObservableList<Project> _projects = ObservableList();

  @observable
  bool loading = false;

  @observable
  String _search = '';

  @computed
  List<Project> get projects {
    return this._projects.where((Project project) {
      return project.name.toLowerCase().contains(this._search.toLowerCase());
    }).toList();
  }


  @action
  Future<void> loadProjects({@required Organization organization}) async {
    this.loading = true;
    this._projects = ObservableList.of(
        await BugsnagClient.getProjects(organization: organization));
    this.loading = false;
  }

  @action
  void search({@required String value}) {
    this._search = value;
  }
}

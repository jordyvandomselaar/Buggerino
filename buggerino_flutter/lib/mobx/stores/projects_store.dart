import 'package:buggerino_flutter/api/bugsnag.dart';
import 'package:buggerino_flutter/models/Organization.dart';
import 'package:buggerino_flutter/models/Project.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'projects_store.g.dart';

class ProjectsStore = _ProjectsStore with _$ProjectsStore;

abstract class _ProjectsStore with Store {
  @observable
  ObservableList<Project> projects = ObservableList();

  @observable
  bool loading = false;

  @action
  Future<void> loadProjects({@required Organization organization}) async {
    this.loading = true;
    this.projects = ObservableList.of(
        await BugsnagClient.getProjects(organization: organization));
    this.loading = false;
  }
}

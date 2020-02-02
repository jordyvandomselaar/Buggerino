import 'package:buggerino_flutter/api/bugsnag.dart';
import 'package:buggerino_flutter/models/BugsnagError.dart';
import 'package:buggerino_flutter/models/Organization.dart';
import 'package:buggerino_flutter/models/Project.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'errors_store.g.dart';

class ErrorsStore = _ErrorsStore with _$ErrorsStore;

abstract class _ErrorsStore with Store {
  @observable
  ObservableList<BugsnagError> errors = ObservableList();

  @observable
  bool loading = false;

  @action
  Future<void> loadErrors({@required Project project}) async {
    this.loading = true;
    this.errors =
        ObservableList.of(await BugsnagClient.getErrors(project: project));
    this.loading = false;
  }
}

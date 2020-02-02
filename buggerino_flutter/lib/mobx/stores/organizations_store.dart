import 'package:buggerino_flutter/api/bugsnag.dart';
import 'package:buggerino_flutter/models/Organization.dart';
import 'package:mobx/mobx.dart';

part 'organizations_store.g.dart';

class OrganizationsStore = _OrganizationsStore with _$OrganizationsStore;

abstract class _OrganizationsStore with Store {
  @observable
  ObservableList<Organization> organizations = ObservableList();

  @observable
  bool loading = false;

  @action
  Future<void> loadOrganizations() async {
    this.loading = true;
    this.organizations =
        ObservableList.of(await BugsnagClient.getOrganizations());
    this.loading = false;
  }
}

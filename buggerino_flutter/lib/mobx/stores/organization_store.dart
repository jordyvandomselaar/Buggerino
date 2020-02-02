import 'package:buggerino_flutter/api/bugsnag.dart';
import 'package:buggerino_flutter/models/Organization.dart';
import 'package:mobx/mobx.dart';

part 'organization_store.g.dart';

class OrganizationStore = _OrganizationStore with _$OrganizationStore;

abstract class _OrganizationStore with Store {
  @observable
  ObservableList<Organization> organizations;

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

import 'package:buggerino_flutter/components/SelectPage.dart';
import 'package:buggerino_flutter/mobx/stores/organization_store.dart';
import 'package:buggerino_flutter/models/Organization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SelectOrganizationPage extends StatelessWidget {
  final organizationStore = OrganizationStore();

  SelectOrganizationPage() {
    this.organizationStore.loadOrganizations();
  }

  void selectOrganization(Organization organization, BuildContext context) {
    Navigator.of(context).pushNamed("/projects", arguments: organization);
  }

  @override
  Widget build(BuildContext context) {
    return SelectPage(title: "Select an organization", children: <Widget>[
      Observer(builder: (_) {
        if (this.organizationStore.loading == true) {
          return SliverList(
            delegate: SliverChildListDelegate([Text("Loading…")]),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
              title: Text(this.organizationStore.organizations[index].name),
              onTap: () =>
                  this.selectOrganization(
                      this.organizationStore.organizations[index], context),
            );
          }, childCount: this.organizationStore.organizations.length),
        );
      })
    ]);
  }
}
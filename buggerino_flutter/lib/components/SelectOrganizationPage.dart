import 'package:buggerino_flutter/bloc/Organizations/bloc.dart';
import 'package:buggerino_flutter/components/SelectPage.dart';
import 'package:buggerino_flutter/models/Organization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectOrganizationPage extends StatelessWidget {
  void selectOrganization(Organization organization, BuildContext context) {
    Navigator.of(context).pushNamed("/projects", arguments: organization);
  }

  @override
  Widget build(BuildContext context) {
    return SelectPage(
      title: "Select an organization",
      child: BlocBuilder<OrganizationsBloc, OrganizationsState>(
          builder: (context, state) {
        if (state is OrganizationsLoadingState) {
          return SliverList(
            delegate: SliverChildListDelegate([Text("Loading…")]),
          );
        }

        if (state is OrganizationsLoadedState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                title: Text(state.organizations[index].name),
                onTap: () => this.selectOrganization(state.organizations[index], context),
              );
            }, childCount: state.organizations.length),
          );
        }
        return SliverList(
          delegate: SliverChildListDelegate([Text("Something went wrong, please restart app")]),
        );
      }),
    );
  }
}

import 'package:buggerino_flutter/bloc/Organizations/organizations_bloc.dart';
import 'package:buggerino_flutter/bloc/Organizations/organizations_state.dart';
import 'package:buggerino_flutter/components/SelectPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectOrganizationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectPage(
      title: "Select an organization",
      child: BlocBuilder<OrganizationsBloc, OrganizationsState>(
          builder: (context, state) {
        if (state is OrganizationsLoadingState) {
          return SliverList(
            delegate: SliverChildListDelegate([Text("Hey")]),
          );
        }

        if (state is OrganizationsLoadedState) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                title: Text(state.organizations[index].name),
              );
            }),
          );
        }
        return SliverList(
          delegate: SliverChildListDelegate([Text("Bye")]),
        );
      }),
    );
//    final organizations = AppStateData.of(context).organizations;
//    return SelectPage(
//      title: "Start by selecting an organization",
//      childBuilderDelegate:
//          SliverChildBuilderDelegate((BuildContext context, int index) {
//        return ListTile(
//          title: Text(organizations[index].name),
//        );
//      }, childCount: organizations.length),
//    );
  }
}

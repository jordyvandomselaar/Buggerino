import 'package:buggerino_flutter/bloc/Projects/bloc.dart';
import 'package:buggerino_flutter/components/SelectPage.dart';
import 'package:buggerino_flutter/models/Organization.dart';
import 'package:buggerino_flutter/models/Project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectProjectPage extends StatelessWidget {
  final Organization organization;
  final ProjectsBloc projectsBloc;

  SelectProjectPage({Key key, @required this.organization, @required this.projectsBloc}) : super(key: key) {
    this.projectsBloc.add(LoadProjects(organization: this.organization));
  }

  selectProject(Project project, BuildContext context) {
    Navigator.of(context).pushNamed("/errors", arguments: project);
  }

  @override
  Widget build(BuildContext context) {
    return SelectPage(
      title: "Select a project",
      child: BlocBuilder<ProjectsBloc, ProjectsState>(
        builder: (context, state) {
          if (state is ProjectsLoadingState) {
            return SliverList(
              delegate: SliverChildListDelegate([Text("Loading…")]),
            );
          }

          if (state is ProjectsLoadedState) {
            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ListTile(
                  title: Text(state.projects[index].name),
                  trailing: Text(state.projects[index].openErrorCount.toString()),
                  onTap: () => this.selectProject(state.projects[index], context),
                );
              }, childCount: state.projects.length),
            );
          }
          return SliverList(
            delegate: SliverChildListDelegate([Text("Something went wrong, please restart app")]),
          );
        },
      ),
    );
  }
}
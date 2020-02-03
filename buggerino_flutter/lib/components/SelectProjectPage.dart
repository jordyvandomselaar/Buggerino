import 'package:buggerino_flutter/components/SelectPage.dart';
import 'package:buggerino_flutter/mobx/stores/projects_store.dart';
import 'package:buggerino_flutter/models/Organization.dart';
import 'package:buggerino_flutter/models/Project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SelectProjectPage extends StatelessWidget {
  final Organization organization;
  final ProjectsStore projectsStore = ProjectsStore();

  SelectProjectPage({Key key, @required this.organization}) : super(key: key) {
    this.projectsStore.loadProjects(organization: this.organization);
  }

  selectProject(Project project, BuildContext context) {
    Navigator.of(context).pushNamed("/errors", arguments: project);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        List<Widget> children = [
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged: (String value) {
                    this.projectsStore.search(value: value);
                  },
                  decoration: InputDecoration(labelText: "Search"),
                ),
              )
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                title: Text(this.projectsStore.projects[index].name),
                trailing: Text(this
                    .projectsStore
                    .projects[index]
                    .openErrorCount
                    .toString()),
                onTap: () =>
                    this
                        .selectProject(
                        this.projectsStore.projects[index], context),
              );
            }, childCount: this.projectsStore.projects.length),
          )
        ];

        if (this.projectsStore.loading == true) {
          children = [
            SliverList(
              delegate: SliverChildListDelegate([Text("Loading…")]),
            )
          ];
        }

        return SelectPage(
          title: "Select a project",
          children: children,
        );
      },
    );
  }
}

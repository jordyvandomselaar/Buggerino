import 'package:buggerino_flutter/components/SelectPage.dart';
import 'package:buggerino_flutter/models/Project.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Hi");
//    final projects = AppStateData.of(context).projects;
//
//    return SelectPage(
//      title: "Select a project",
//      childBuilderDelegate: SliverChildBuilderDelegate(
//          (BuildContext context, int index) {
//            Project project = projects[index];
//
//            return ListTile(
//              title: Text(project.name),
//              trailing: Text("${project.openErrorCount.toString()} open"),
//            );
//          },
//        childCount: projects.length
//      ),
//    );
  }
}
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:buggerino_flutter/api/bugsnag.dart';
import 'bloc.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  @override
  ProjectsState get initialState => InitialProjectsState();

  @override
  Stream<ProjectsState> mapEventToState(
    ProjectsEvent event,
  ) async* {
    if(event is LoadProjects) {
      yield ProjectsLoadingState();

      final projects = await BugsnagClient.getProjects(organization: event.organization);

      yield ProjectsLoadedState(projects: projects);
    }
  }
}

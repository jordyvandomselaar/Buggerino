import 'package:buggerino_flutter/models/Project.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ProjectsState extends Equatable {
  const ProjectsState();

  @override
  List<Object> get props => [];
}

class InitialProjectsState extends ProjectsState {}

class ProjectsLoadingState extends ProjectsState {}

class ProjectsLoadedState extends ProjectsState {
  final List<Project> projects;

  ProjectsLoadedState({@required this.projects});
}
import 'package:buggerino_flutter/models/Organization.dart';
import 'package:equatable/equatable.dart';

abstract class ProjectsEvent extends Equatable {
  const ProjectsEvent();
}

class LoadProjects extends ProjectsEvent {
  final Organization organization;

  LoadProjects({this.organization});

  @override
  List<Object> get props => [organization];
}
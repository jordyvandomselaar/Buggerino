import 'package:buggerino_flutter/models/Organization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class OrganizationsState extends Equatable {
  const OrganizationsState();

  @override
  List<Object> get props => [];
}

class InitialOrganizationsState extends OrganizationsState {}

class OrganizationsLoadingState extends OrganizationsState {}

class OrganizationsLoadedState extends OrganizationsState {
  final List<Organization> organizations;

  const OrganizationsLoadedState({@required this.organizations});
}


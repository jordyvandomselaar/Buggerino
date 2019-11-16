import 'package:buggerino_flutter/models/User.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class OrganizationsEvent extends Equatable {
  const OrganizationsEvent();
}

class LoadOrganizations extends OrganizationsEvent {
  @override
  List<Object> get props => [];
}
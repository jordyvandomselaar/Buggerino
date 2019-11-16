import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:buggerino_flutter/api/bugsnag.dart';
import './bloc.dart';

class OrganizationsBloc extends Bloc<OrganizationsEvent, OrganizationsState> {
  @override
  OrganizationsState get initialState => InitialOrganizationsState();

  @override
  Stream<OrganizationsState> mapEventToState(
    OrganizationsEvent event,
  ) async* {
    if(event is LoadOrganizations) {
      yield new OrganizationsLoadingState();

      final organizations = await BugsnagClient.getOrganizations();

      yield new OrganizationsLoadedState(organizations: organizations);
    }
  }
}

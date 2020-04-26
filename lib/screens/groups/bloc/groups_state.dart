part of 'groups_bloc.dart';

abstract class GroupsState extends Equatable {
  const GroupsState();

  @override
  List<Object> get props => [];
}

// State for group list
class GetGroupsInitial extends GroupsState {}

class GetGroupsInProgress extends GroupsState {}

class GetGroupsSuccess extends GroupsState {
  final List<DocumentSnapshot> groups;

  GetGroupsSuccess(this.groups);

  @override
  List<Object> get props => [groups];
}

class GetGroupsFailure extends GroupsState {}

// State for single group details
class GetSingleGroupsDetailsInitial extends GroupsState {}

class GetSingleGroupsDetailsInProgress extends GroupsState {}

class GetSingleGroupsDetailsSuccess extends GroupsState {}

class GetSingleGroupsDetailsFailure extends GroupsState {}

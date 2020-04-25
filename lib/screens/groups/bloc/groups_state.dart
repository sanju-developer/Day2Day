part of 'groups_bloc.dart';

abstract class GroupsState extends Equatable {
  const GroupsState();

  @override
  List<Object> get props => [];
}

class GetGroupsInitial extends GroupsState {}

class GetGroupsLoadInProgress extends GroupsState {}

class GetGroupsLoadSuccess extends GroupsState {}

class GetGroupsLoadFailure extends GroupsState {}

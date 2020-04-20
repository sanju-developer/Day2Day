part of 'groups_bloc.dart';

abstract class GroupsState extends Equatable {
  const GroupsState();

  @override
  List<Object> get props => [];
}

class GetGroupsInitial extends GroupsState {}

class GetGroupsProgress extends GroupsState {}

class GetGroupsSuccess extends GroupsState {}

class GetGroupsFailure extends GroupsState {}

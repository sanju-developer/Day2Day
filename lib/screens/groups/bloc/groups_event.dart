part of 'groups_bloc.dart';

abstract class GroupsEvent extends Equatable {
  const GroupsEvent();

  @override
  List<Object> get props => [];
}

class FetchGroups extends GroupsEvent {}

class FetchSingleGroupDetail extends GroupsEvent {
  final String groupId;

  FetchSingleGroupDetail(this.groupId);

  @override
  List<Object> get props => [groupId];
}

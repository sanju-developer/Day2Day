import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:day2day/services/groups_service/groups_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final GroupsRepository _groupsRepository;

  GroupsBloc({@required GroupsRepository groupsRepository})
      : assert(_groupsRepository != null),
        _groupsRepository = groupsRepository;

  @override
  GroupsState get initialState => GetGroupsInitial();

  @override
  Stream<GroupsState> mapEventToState(GroupsEvent event) async* {
    if (event is FetchGroupsList) {
      yield* _mapFetchedGroupsListToState();
    }
  }

  Stream<GroupsState> _mapFetchedGroupsListToState() async* {
    try {
      await _groupsRepository.fetchGroupsList();
      yield GetGroupsSuccess();
    } catch (e) {
      print('Exception while fetching Groups list $e');
      yield GetGroupsFailure();
    }
  }
}
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day2day/services/groups_service/groups_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

part 'groups_event.dart';
part 'groups_state.dart';

class GroupsBloc extends Bloc<GroupsEvent, GroupsState> {
  final GroupsRepository _groupsRepository;

  GroupsBloc({@required GroupsRepository groupsRepository})
      : assert(groupsRepository != null),
        _groupsRepository = groupsRepository;

  @override
  GroupsState get initialState => GetGroupsInitial();

  @override
  Stream<GroupsState> mapEventToState(GroupsEvent event) async* {
    if (event is FetchGroups) {
      yield* _mapFetchedGroupsListToState();
    } else if (event is FetchSingleGroupDetail) {}
  }

  Stream<GroupsState> _mapFetchedGroupsListToState() async* {
    try {
      yield GetGroupsInProgress();
      final documents = await _groupsRepository.fetchGroups();
      yield GetGroupsSuccess(documents);
    } catch (e) {
      print('Exception while fetching Groups list $e');
      yield GetGroupsFailure();
    }
  }
}

import 'dart:async';

import 'package:day2day/api/api.dart';
import 'package:day2day/api/endpoints.dart';

class GroupsRepository {
  final _api = API();
  final _endpoints = Endpoints();

  Future<Object> fetchGroups() async {
    final response = await _api.apiCallForGet(_endpoints.getGroups);
    return response;
  }
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class GroupsRepository {
  final databaseReference = Firestore.instance;

  Future<QuerySnapshot> fetchGroups() async {
    final response =
        await databaseReference.collection("groups").getDocuments();
    return response;
  }
}

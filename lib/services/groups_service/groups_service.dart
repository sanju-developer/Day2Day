import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class GroupsRepository {
  final databaseReference = Firestore.instance;

  Future<List<DocumentSnapshot>> fetchGroups() async {
    final QuerySnapshot response =
        await databaseReference.collection("groups").getDocuments();
    return response.documents;
  }
}

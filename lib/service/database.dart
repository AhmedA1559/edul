import 'dart:async';

import 'package:edul/model/group.dart';
import 'package:edul/model/item.dart';
import 'package:firebase_database/firebase_database.dart';

import '../const.dart';

class Database {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  final String _uid;

  Database(this._uid);

  Stream<DatabaseEvent> itemStream(String listId) {
    return _firebaseDatabase.ref(FirebasePath.listPath(listId)).onValue;
  }

  Future<void> createItem(Item item, String listId) async {
    final newKey = _firebaseDatabase.ref(FirebasePath.listPath(listId)).push().key;

    await updateItem(item.copyWith(id: newKey), listId);
  }

  Future<void> updateItem(Item item, String listId) async {
    await _firebaseDatabase.ref(FirebasePath.itemPath(listId, item.id!)).update(item.toMap());
  }

  Future<void> deleteItem(Item item, String listId) async {
    await _firebaseDatabase.ref(FirebasePath.itemPath(listId, item.id!)).remove();
  }

  Stream<DatabaseEvent> groupStream() {
    return _firebaseDatabase.ref(FirebasePath.groupsPath(_uid)).onValue;
  }
}
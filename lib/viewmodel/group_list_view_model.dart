import 'dart:convert';

import 'package:edul/model/group.dart';
import 'package:edul/service/database.dart';

class GroupListViewModel {
  final Database database;

  GroupListViewModel({required this.database});

  Stream<List<Group>> getStream() {
    final dataStream = database.groupStream();
    return dataStream.map<List<Group>>((event) => _convert(jsonDecode(jsonEncode(event.snapshot.value))));
  }

  List<Group> _convert(Map encodedMap) {
    return encodedMap.entries.map((e) => Group.fromMap({...e.value, 'id':e.key})).toList();
  }
}
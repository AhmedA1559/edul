class FirebaseConst {
  static const String REPOSITORY = "https://us-central1-edul-db1db.cloudfunctions.net";
}

class FirebasePath {
  static String listPath(String listId) => '/list/$listId';

  static String itemPath(String listId, String itemPath) => '/list/$listId/$itemPath';

  static String groupsPath(String uid) => '/user/$uid/groups';
}
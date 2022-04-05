import 'package:edul/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'invite_manager.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

final authStateChangesProvider = StreamProvider<User?>(
    (ref) => ref.watch(firebaseAuthProvider).authStateChanges());

final inviteManagerProvider = Provider<InviteManager?>((ref) {
  final uid = ref.watch(authStateChangesProvider).asData?.value?.uid;
  if (uid != null) return InviteManager(ref);
  return null;
});

final databaseProvider = Provider<Database?>((ref) {
  final user = ref.watch(authStateChangesProvider);
  //print(uid);
  return user.when(data: (User? data) { return Database(data!.uid); }, loading: () { return null; }, error: (Object error, StackTrace? stackTrace) { return; }

  );
});

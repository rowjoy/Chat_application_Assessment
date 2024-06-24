import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'auth_provider.dart';


final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final usersCollectionProvider = Provider<CollectionReference>((ref) {
  return ref.watch(firestoreProvider).collection('users');
});

class UserService {
  final CollectionReference usersCollection;
  UserService(this.usersCollection);

  Stream<QuerySnapshot> getUsers() {
    return usersCollection.snapshots();
  }

  // Future<void> addUser(String userId, String email) async {
  //   await usersCollection.doc(userId).set({'email': email});
  // }

  // Future<DocumentSnapshot> getUser(String userId) async {
  //   return usersCollection.doc(userId).get();
  // }
}

final userServiceProvider = Provider<UserService>((ref) {
  return UserService(ref.watch(usersCollectionProvider));
});

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Firestore Provider
final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

// Chat Collection Provider
final chatCollectionProvider = Provider<CollectionReference>((ref) {
  return ref.watch(firestoreProvider).collection('chats');
});

class ChatService {
  final CollectionReference chatCollection;
  ChatService(this.chatCollection);

  Stream<QuerySnapshot> getMessagesBetween(String userId, String peerId) {
    final responce = chatCollection
        .where('participants', arrayContains: userId)
        .orderBy('timestamp', descending: true)
        .snapshots();
    return responce;
  }

  Future<void> sendMessage(String userId, String peerId, String message) async {
    await chatCollection.add({
      'participants': [userId, peerId],
      'userId': userId,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}

final chatServiceProvider = Provider<ChatService>((ref) {
  return ChatService(ref.watch(chatCollectionProvider));
});

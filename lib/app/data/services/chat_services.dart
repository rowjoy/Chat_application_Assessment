// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';



class ChatService {
  final CollectionReference chatCollection;
  ChatService(this.chatCollection);

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getMessages(String chatRoomId) {
     final responce = firebaseFirestore.collection("chatRoom").doc(chatRoomId).collection("chats").orderBy("time", descending: false).snapshots();
     return responce;
  }

  Future<void> sendMessage( String chatRoomId, String message, String username, String email) async {
    await firebaseFirestore.collection("chatRoom").doc(chatRoomId).collection("chats").add({
       "sendby": username,
       "message" : message,
       "time" : FieldValue.serverTimestamp(),
       "email": email,
    });
  }
}


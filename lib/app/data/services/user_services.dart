import 'package:cloud_firestore/cloud_firestore.dart';




class UserService {
  final CollectionReference usersCollection;
  UserService(this.usersCollection);

  Stream<QuerySnapshot> getUsers() {
    return usersCollection.snapshots();
  }


   String chatRoomId (String user1 , String user2){
    if (user1[0].toLowerCase().codeUnits[0] > user2[0].toLowerCase().codeUnits[0]){
      return "$user1$user2";
    }else {
      return "$user2$user1";
    }
 }
}


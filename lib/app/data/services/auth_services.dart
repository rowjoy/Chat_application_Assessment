// ignore_for_file: unnecessary_brace_in_string_interps, body_might_complete_normally_nullable, unused_field, prefer_final_fields, unnecessary_null_comparison, await_only_futures, avoid_print

import 'package:chatapplication/core/values/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth;
  AuthService(this._auth);


  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }


    FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    if (userCredential != null){
      String displayNmae =  AppString().generateRandomString(10);
      userCredential.user!.updateProfile(displayName:displayNmae);
      await _firebaseFirestore.collection("users").doc(_auth.currentUser!.uid).set({
         "userName" : displayNmae,
         "email" : email,
         "status" : "Unavalible",
         "uids" : _auth.currentUser!.uid,
         "Phato" : "",
         "idCreatedTime" : DateTime.now().toString(),
      });

    }
    print("userCredential ${userCredential}");
  }




  Future<void> signOut() async {
    await _auth.signOut();
  }
}




/*
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
    match /chats/{chatId} {
      allow read, write: if request.auth != null;
    }
  }
}


 match /{document=**} {
      allow read, write: if true;
    }
*/

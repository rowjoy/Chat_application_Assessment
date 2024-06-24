

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth_services.dart';
import '../services/chat_services.dart';
import '../services/user_services.dart';


//Firebase Auth provider
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// Firebase auth State Changes
final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});


//Auth Service Provider 
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.watch(firebaseAuthProvider));
});






// Firestore Provider
final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

// Chat Collection Provider
final chatCollectionProvider = Provider<CollectionReference>((ref) {
  return ref.watch(firestoreProvider).collection('chats');
});


//Chat Service Provider
final chatServiceProvider = Provider<ChatService>((ref) {
  return ChatService(ref.watch(chatCollectionProvider));
});


//users Collection Provider
final usersCollectionProvider = Provider<CollectionReference>((ref) {
  return ref.watch(firestoreProvider).collection('users');
});


//user Service Provider
final userServiceProvider = Provider<UserService>((ref) {
  return UserService(ref.watch(usersCollectionProvider));
});

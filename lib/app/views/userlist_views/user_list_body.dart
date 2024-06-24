// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/services/user_services.dart';
import '../chat_views/chat_views.dart';

class UserListBody {
 late UserService userService;
 late AsyncValue<User?> authState;

 UserListBody({required this.authState, required this.userService});

 view (){
   return  StreamBuilder<QuerySnapshot>(
        stream: userService.getUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.data!.docs.length == 1){
            return Center(
              child:  Text("User not found"),
            );
          }
          final users = snapshot.data!.docs;
          final currentUser = authState.asData?.value;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return  currentUser!.email == user["email"] ? SizedBox() : ListTile(
                leading: CircleAvatar(
                  child: Text(user['userName'][0].toString()),
                ),
                title: Text(user['userName'].toString()),
                subtitle: Text(user["email"]),
                onTap: () {
                   final roomId = userService.chatRoomId(currentUser.displayName!, user["userName"]);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatViews(
                        chatRoomID: roomId,
                        peerId: user.id, 
                        peerEmail: user['email'],
                        userName:  user["userName"],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
    );
  }
}
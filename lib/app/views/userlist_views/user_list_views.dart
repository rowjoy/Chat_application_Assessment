// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print

import 'package:chatapplication/core/theme/extra_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/services/auth_provider.dart';
import '../../data/services/user_provider.dart';
import '../chat_views/chat_views.dart';

class UserListScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userService = ref.watch(userServiceProvider);
    final authState = ref.watch(authStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat user list'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.logout,color: ExtraColors.redColors,),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: userService.getUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final users = snapshot.data!.docs;
          final currentUser = authState.asData?.value;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return  ListTile(
                leading: CircleAvatar(
                  child: Text(user['userName'][0].toString()),
                ),
                title: Text(user['userName']),
                subtitle: Text(user["email"]),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(peerId: user.id, peerEmail: user['email']),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/provider/providers.dart';
import '../../data/services/notification_services.dart';

class ChatViews extends HookConsumerWidget {
  final String peerId;
  final String peerEmail;
  final String chatRoomID;
  final String userName;

  const ChatViews({required this.peerId, required this.peerEmail,required this.chatRoomID,required this.userName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatService = ref.watch(chatServiceProvider);
    final authState = ref.watch(authStateProvider);
    final user = authState.asData?.value;
    final messageController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $peerEmail'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              //stream: chatService.getMessagesBetween(user!.uid, peerId),
              stream:  chatService.getMessages(chatRoomID),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.active){
                  final messagenotify =  snapshot.data!.docs;
                  final lastMessage = messagenotify.isNotEmpty ? messagenotify.first : null;
                  if (lastMessage != null &&  lastMessage["email"] != user!.email){
                     NotificationServices().showNotification(title:  lastMessage['message'], dateTime: DateTime.now().toString(), payload: lastMessage["sendby"]);
                  }
                  
                }
                final messages = snapshot.data!.docs;
                return ListView.builder(
                  reverse: false,
                  shrinkWrap: true,
                  //dragStartBehavior: DragStartBehavior.down,

                  physics: ScrollPhysics(),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMe = message['email'] != user!.email;
                    
                    return ListTile(
                      title: Align(
                        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.blue : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text( message['message'] ,
                            style: TextStyle(color: isMe ? Colors.white : Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(hintText: 'Enter your message...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    
                    if (messageController.text.isNotEmpty) {
                      // await chatService.sendMessage(user!.uid, peerId, messageController.text);
                      await chatService.sendMessage(chatRoomID, messageController.text, userName, peerEmail);
                      messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:chatapplication/app/views/chat_views/chat_views.dart';
import 'package:chatapplication/app/views/login_views/login_views.dart';
import 'package:chatapplication/core/utils/keys.dart';
import 'package:chatapplication/core/utils/shared_preferen.dart';
import 'package:go_router/go_router.dart';

import '../views/userlist_views/user_list_views.dart';

class AppRoute {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: '/',
        path: '/',
        builder: (context, state) => LoginViews(),
      ),
      GoRoute(
        name: '/userListViews',
        path: '/userListViews',
        builder: (context, state) => UserListViews(),
      ),
      GoRoute(
        name: '/chatViews',
        path: '/chatViews/:peerId/:peerEmail/:chatRoomID/:userName',
        builder: (context, state) {
           final String peerId = state.pathParameters["peerId"]!;
           final String peerEmail = state.pathParameters["peerEmail"]!;
           final String chatRoomID = state.pathParameters["chatRoomID"]!;
           final String userName = state.pathParameters["userName"]!;
           return ChatViews(peerId: peerId, peerEmail: peerEmail, chatRoomID: chatRoomID, userName: userName);
        },
      ),
    ],
    redirect: (context, state) {
      final tocken = SharedPreferencesHelper.getString(AppKeys.authTocken);
      if (tocken != null){
         return '/userListViews';
      }else {
        return '/';
      }
    },
  );
}
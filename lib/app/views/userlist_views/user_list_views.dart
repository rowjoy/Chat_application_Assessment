// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print, unused_local_variable, use_build_context_synchronously

import 'package:chatapplication/app/views/userlist_views/user_list_body.dart';
import 'package:chatapplication/core/theme/extra_colors.dart';
import 'package:chatapplication/core/utils/keys.dart';
import 'package:chatapplication/core/utils/shared_preferen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/provider/providers.dart';

class UserListViews extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userService = ref.watch(userServiceProvider);
    final authState = ref.watch(authStateProvider);
    final authServices = ref.watch(authServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat user list'),
        actions: [
          IconButton(
            onPressed: () async{
              await SharedPreferencesHelper.remove(AppKeys.authTocken);
              context.replace('/');
            }, 
            icon: Icon(Icons.logout,color: ExtraColors.redColors,),
          )
        ],
      ),
      body: UserListBody(authState: authState,userService: userService).view(),
    );
  }
}

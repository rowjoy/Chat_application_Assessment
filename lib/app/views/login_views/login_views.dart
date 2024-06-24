// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously

import 'package:chatapplication/app/views/login_views/login_body.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/provider/providers.dart';

class LoginViews extends HookConsumerWidget {
  const LoginViews({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final authService = ref.watch(authServiceProvider);
    return Scaffold(
       body: LoginBody(authService: authService).view(context),
    );
  }
}
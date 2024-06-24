// ignore_for_file: prefer_const_constructors

import 'package:chatapplication/app.dart';
import 'package:chatapplication/app/data/services/notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // is a crucial call in Flutter, particularly for applications that need to interact with platform-specific code or asynchronous services before the app fully initializes.
  await Firebase.initializeApp(); // Firebase initialize [Start firebase]
  await NotificationServices().init();
  runApp(const ProviderScope(child: MyApp())); // ProviderScope is flutter_riverpod state management 
}
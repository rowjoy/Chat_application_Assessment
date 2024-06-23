import 'package:chatapplication/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // is a crucial call in Flutter, particularly for applications that need to interact with platform-specific code or asynchronous services before the app fully initializes.
 // await Firebase.initializeApp(); // Firebase initialize [Start firebase]
  runApp(const ProviderScope(child: MyApp())); // ProviderScope is flutter_riverpod state management 
}
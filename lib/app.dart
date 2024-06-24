// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'app/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Chat App',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //     useMaterial3: true,
    //   ),
    //    home: LoginViews(),
    // );
    return MaterialApp.router(
       debugShowCheckedModeBanner: false,
       title: 'Chat App',
       theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
       ),
       routerConfig: AppRoute().router,
      //  routeInformationParser:AppRoute().router.routeInformationParser,
      //  routerDelegate: AppRoute().router.routerDelegate,
      //  routeInformationProvider: AppRoute().router.routeInformationProvider,
      //  backButtonDispatcher: AppRoute().router.backButtonDispatcher,
    );
  }
}
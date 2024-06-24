// ignore_for_file: unnecessary_brace_in_string_interps, prefer_const_constructors

import 'package:flutter/material.dart';

class AppAlert {
  final BuildContext context;
  final String title;
   AppAlert({ required this.context, required this.title});
   flutterShowSnackber (){
     ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                // ignore: unnecessary_string_interpolations
                content: Text(title),
                duration: Duration(seconds: 2),
              ),
            );
   }
} 
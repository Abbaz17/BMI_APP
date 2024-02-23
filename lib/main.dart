import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/reasuble_card.dart';

import 'screans/home.dart';

void main() {
  runApp(BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0a0e21) ,
        scaffoldBackgroundColor: Color(0xff0a0e21) 
      ),
      home: HomeScreen(),
    );
  }
}



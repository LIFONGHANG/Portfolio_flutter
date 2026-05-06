import 'package:flutter/material.dart';
import 'package:twitter_card_flutter/pages/home.dart';
import 'package:twitter_card_flutter/widgets/bottom_navigationbar.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationbar(),
      
    );
    
    
  }
}
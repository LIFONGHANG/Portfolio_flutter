import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_card_flutter/provider/favorite_provider.dart';
import 'package:twitter_card_flutter/widgets/bottom_navigationbar.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MyApp(),
    ),
  );
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

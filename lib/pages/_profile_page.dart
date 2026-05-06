import 'package:flutter/material.dart';
import 'package:twitter_card_flutter/pages/pokemonpractice.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Center(
          child: Text(
            "Profile Page Content",
          ), // you can keep your old Column here
        ),
      ),
    );
  }

}
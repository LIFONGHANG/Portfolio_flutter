import 'package:flutter/material.dart';
import 'package:twitter_card_flutter/pages/buttonpractice.dart';
import 'package:twitter_card_flutter/pages/pokemonpractice.dart';
import 'package:twitter_card_flutter/pages/secondpage.dart';
import 'package:twitter_card_flutter/pages/textinput.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(context),
      appBar: _appBar(context),
      body: const SafeArea(
        child: Center(
          child: Text(
            "Profile Page Content",
          ), // you can keep your old Column here
        ),
      ),
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue[100],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(color: Colors.blue[300]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Lifong's Practice",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Second Page'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Secondpage()),
                );
              },
            ),
            ListTile(
              title: const Text('Button practice'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Buttonpractice(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('TextField'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Textinput()),
                );
              },
            ),
            ListTile(
              title: Text("Pokemon (Async/Await)"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Pokemonpractice()));
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[300],
      centerTitle: true,
      title: const Text(
        'Lifong Random Stuff',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:twitter_card_flutter/pages/_profile_page.dart';
import 'package:twitter_card_flutter/pages/favorite_page.dart';
import 'package:twitter_card_flutter/pages/home.dart';



class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  int selectedIndex = 0;
  final List pages = [
    HomePage(),
    FavoritePage(),
    Center(child: Text("Settings Page")),
    ProfilePage(),
  ];
  void _navbottom_press(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _navbottom_press,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.business,color: Colors.cyan), label: 'Project',),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.blue,), label: 'Profile'),
        ],
      ),
    );
  }
}

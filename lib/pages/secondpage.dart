import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(children: [_buildheader(), _bodytext(), _bodyimage()]),
        ),
      ),
    );
  }
}

Row _buildheader() {
  return Row(
    children: [
      CircleAvatar(
        backgroundImage: (AssetImage('assets/andrea-avatar.png')),
        radius: 25,
      ),
      SizedBox(width: 6),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Andrea Bizzotto',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                SvgPicture.asset('assets/icons/icon_heart_blue.svg', width: 15),
                SizedBox(width: 5),
                SvgPicture.asset('assets/icons/verify_icon.svg', width: 15),
              ],
            ),

            Row(
              children: [
                Text('@biz84'),
                SizedBox(width: 6),
                Text(
                  'Follow',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 1, 128, 233),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      SvgPicture.asset('assets/icons/twitter_logo_icon.svg', width: 24),
    ],
  );
}

ClipRRect _bodyimage() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.asset('assets/body_picture.jpg'),
  );
}

Padding _bodytext() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text('Did you Know?', style: TextStyle(fontSize: 16)),
        SizedBox(height: 15),
        Text(
          'When you call `MediaQuery.of(context)` inside a build method, the widget will rebuild when *any* of the MediaQuery properties change.',
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 15),
        Text(
          "But there's a better way that lets you depend only on the properties you care about (and minimize unnecessary rebuilds). 👇",
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.blue[300],
    centerTitle: true,
    title: Text("Second Page", style: TextStyle(color: Colors.black)),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}

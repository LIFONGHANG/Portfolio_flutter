import 'package:flutter/material.dart';
import 'package:twitter_card_flutter/pages/secondpage.dart';

// Textinput
class Textinput extends StatefulWidget {
  const Textinput({super.key});

  @override
  State<Textinput> createState() => _TextinputState();
}

class _TextinputState extends State<Textinput> {
  String userinput = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        centerTitle: true,
        title: Text('Textfield Practice'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) => setState(() {
                userinput = value;
              }),
            ),
          ),
          Text(userinput, style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}

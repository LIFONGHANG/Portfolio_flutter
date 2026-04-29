import 'package:flutter/material.dart';

//Increase decrease button section
class Buttonpractice extends StatefulWidget {
  const Buttonpractice({super.key});

  @override
  State<Buttonpractice> createState() => _CounterSectionState();
}

class _CounterSectionState extends State<Buttonpractice> {
  int number = 0;
  void increase() {
    setState(() {
      number++;
    });
  }

  void decrease() {
    setState(() {
      number--;

      if (number < 0) {
        number = -1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        centerTitle: true,
        title: Text('Button Practice'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (number >= 0) Text(number.toString()),
            if (number < 0)
              const Text(
                "It can't less than 0",
                style: TextStyle(color: Colors.red),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: decrease, child: const Text('-')),
                ElevatedButton(onPressed: increase, child: const Text('+')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

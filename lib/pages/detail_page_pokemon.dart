import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailPagePokemon extends StatefulWidget {
  final String url;

  const DetailPagePokemon({super.key, required this.url});

  @override
  State<DetailPagePokemon> createState() => _DetailPagePokemonState();
}

class _DetailPagePokemonState extends State<DetailPagePokemon> {
  Map data = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDetail();
  }

  Future<void> fetchDetail() async {
    final response = await http.get(Uri.parse(widget.url));

    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isLoading ? "Loading..." : data['name'])),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // 🖼️ Image
                  Image.network(
                    data['sprites']['front_default'],
                    height: 300,
                    fit: BoxFit.contain,
                  ),

                  // 🏷️ Name
                  Text(
                    data['name'],
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),
                  Row(
                    spacing: 40,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height: ${data['height']}",
                        style: TextStyle(fontSize: 20),
                      ),

                      // ⚖️ Weight
                      Text(
                        "Weight: ${data['weight']}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  // 🔥 Types
                  const Text(
                    "Types:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),

                  ...data['types'].map<Widget>((type) {
                    return Text(
                      type['type']['name'],
                      style: TextStyle(fontSize: 20),
                    );
                  }).toList(),
                ],
              ),
            ),
    );
  }
}


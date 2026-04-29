import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Pokemonpractice extends StatefulWidget {
  const Pokemonpractice({super.key});

  @override
  State<Pokemonpractice> createState() => _PokemonpracticeState();
}

class _PokemonpracticeState extends State<Pokemonpractice> {
  String name = '';
  String imageUrl = '';
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetchPokemon();
  }
    Future<void> fetchPokemon() async {
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon/pikachu');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        name = data['name'];
        imageUrl = data['sprites']['front_default'];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: const Text('Pokemon Viewer'),
  ),
  body: Center(
    child: isLoading
        ? const CircularProgressIndicator()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name.toUpperCase(),
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 20),
              Image.network(imageUrl),
            ],
          ),
  ),
);
  }
}



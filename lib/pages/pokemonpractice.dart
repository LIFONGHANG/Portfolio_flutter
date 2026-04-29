import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

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
    //random number
    var number = Random();
    int randomId = number.nextInt(1000) + 1;

    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$randomId');

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
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon Viewer')),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageUrl.isNotEmpty
                      ? Image.network(imageUrl)
                      : const SizedBox(height: 100,),
                  Text(
                    name.toUpperCase(),
                    style: const TextStyle(fontSize: 24),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      fetchPokemon();
                    },
                    child: const Text("Refresh"),
                  ),
                ],
              ),
      ),
    );
  }
}

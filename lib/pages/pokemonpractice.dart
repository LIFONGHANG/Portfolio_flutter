import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:twitter_card_flutter/pages/detail_page_pokemon.dart';
import 'dart:math';

class Pokemonpractice extends StatefulWidget {
  const Pokemonpractice({super.key});

  @override
  State<Pokemonpractice> createState() => _PokemonpracticeState();
}

class _PokemonpracticeState extends State<Pokemonpractice> {
  List pokemonList = [];
  bool isLoading = true;
  int index = 0;
  @override
  void initState() {
    super.initState();
    fetchPokemon();
  }

  void morebtn(String url) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailPagePokemon(url: url),
    ),
  );
}

  Future<void> fetchPokemon() async {
    //random number
    // var number = Random();
    // int randomId = number.nextInt(1000) + 1;

    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        pokemonList = data['results'];
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: pokemonList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 columns in a row
                          crossAxisSpacing: 10, // spacing of each columns
                          mainAxisSpacing: 10, // spacing of each row
                          childAspectRatio: 0.9, // controls card shape
                        ),
                    itemBuilder: (context, index) {
                      final pokemon = pokemonList[index];
                      final imageUrl =
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png';

                      return Card(
                        elevation: 5, // shadow of each box
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(imageUrl, height: 80),
                            const SizedBox(height: 10),
                            Text(
                              pokemon['name'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                morebtn(pokemon['url']);
                              },
                              child: const Text("More"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

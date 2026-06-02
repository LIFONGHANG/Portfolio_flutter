import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:twitter_card_flutter/pages/detail_page_pokemon.dart';
import 'package:twitter_card_flutter/provider/favorite_provider.dart';

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
      MaterialPageRoute(builder: (context) => DetailPagePokemon(url: url)),
    );
  }

  void addtofavorite(item) {
    context.read<FavoriteProvider>().addFavorite(item);
  }

  Future<void> fetchPokemon() async {
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
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
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

                            // Add to favorite button
                            FavoriteButton(
                              iconSize: 20,
                              isFavorite: favoriteProvider.isFavorite(
                                pokemon["name"],
                              ),

                              valueChanged: (isFavorite) {
                                if (isFavorite) {
                                  favoriteProvider.addFavorite({
                                    "name": pokemon["name"],
                                    "image": imageUrl,
                                    "url": pokemon["url"],
                                  });
                                } else {
                                  favoriteProvider.removeFavorite(
                                    pokemon["name"],
                                  );
                                }
                              },
                            ),
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

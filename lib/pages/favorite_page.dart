import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_card_flutter/provider/favorite_provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {

    final favorites =
        context.watch<FavoriteProvider>().favoriteList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
      ),

      body: ListView.builder(
        itemCount: favorites.length,

        itemBuilder: (context,index){

          final pokemon = favorites[index];

          return ListTile(
            leading: Image.network(
              pokemon["image"],
            ),

            title: Text(
              pokemon["name"],
            ),
          );
        },
      ),
    );
  }
}
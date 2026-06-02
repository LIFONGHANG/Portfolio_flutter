import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List favoriteList = [];

  void addFavorite(Map pokemon) {
    favoriteList.add(pokemon);
    notifyListeners();
  }

  void removeFavorite(String name) {
    favoriteList.removeWhere((pokemon) => pokemon["name"] == name);
    notifyListeners();
  }

  bool isFavorite(String name) {
    return favoriteList.any((pokemon) => pokemon["name"] == name);
  }
}

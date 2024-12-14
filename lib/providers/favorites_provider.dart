import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Recipe> _favorites = [];

  List<Recipe> get favorites => _favorites;

  void addFavorite(Recipe recipe) {
    if (!_favorites.contains(recipe)) {
      _favorites.add(recipe);
      notifyListeners();
    }
  }

  void removeFavorite(Recipe recipe) {
    _favorites.remove(recipe);
    notifyListeners();
  }

  bool isFavorite(Recipe recipe) {
    return _favorites.contains(recipe);
  }
}

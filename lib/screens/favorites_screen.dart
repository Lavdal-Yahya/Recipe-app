import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/providers/favorites_provider.dart';
import 'package:recipe_app/components/meal_card.dart';
import 'package:recipe_app/screens/recipe_creation_screen.dart';
import 'package:recipe_app/screens/recipe_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final combinedRecipes = [
      ...favoritesProvider.favorites,
      ...favoritesProvider.createdRecipes,
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: combinedRecipes.isEmpty
          ? const Center(child: Text("No recipes yet."))
          : ListView.separated(
              itemCount: combinedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = combinedRecipes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecipeDetailScreen(recipeId: recipe.id),
                      ),
                    );
                  },
                  child: MealCard(
                    recipe: recipe,
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(height: h*.04), // Spacing
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RecipeCreationScreen()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}

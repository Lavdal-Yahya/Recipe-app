import 'package:flutter/material.dart';
import 'package:recipe_app/models/ingredient_recipe.dart';
import 'package:recipe_app/models/ingredient_recipe_api.dart';
import 'package:recipe_app/screens/ingredient_recipe_details_screen.dart';


class IngredientRecipeListScreen extends StatefulWidget {
  final List<String> ingredients;

  const IngredientRecipeListScreen({Key? key, required this.ingredients})
      : super(key: key);

  @override
  _IngredientRecipeListScreenState createState() =>
      _IngredientRecipeListScreenState();
}

class _IngredientRecipeListScreenState
    extends State<IngredientRecipeListScreen> {
  late Future<List<IngredientRecipe>> _recipesFuture;

  @override
  void initState() {
    super.initState();
    _recipesFuture =
        IngredientRecipesApi.getRecipesByIngredients(widget.ingredients);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes by Ingredients"),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<IngredientRecipe>>(
        future: _recipesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No recipes found."));
          } else {
            final recipes = snapshot.data!;
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(recipe.image),
                    title: Text(recipe.name),
                    subtitle:
                        Text("Ingredients used: ${recipe.usedIngredientCount}"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              IngredientRecipeDetailsScreen(recipeId: recipe.id),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

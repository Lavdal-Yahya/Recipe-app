import 'package:flutter/material.dart';
import 'package:recipe_app/components/text_field_widget.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/models/recipes_api.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Recipe> _recipes; // Full list of recipes
  late List<Recipe> _filteredRecipes; // Filtered recipes
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecipes("breakfast"); // Default meal type
  }

  Future<void> fetchRecipes(String mealType) async {
    setState(() {
      _isLoading = true;
    });
    try {
      _recipes = await RecipesApi.getRecipe(mealType);
      setState(() {
        _filteredRecipes = _recipes; // Initialize filtered list
      });
    } catch (e) {
      debugPrint("Error fetching recipes: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _searchRecipes(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredRecipes = _recipes; // Show all recipes when query is empty
      } else {
        _filteredRecipes = _recipes
            .where((recipe) => recipe.name.toLowerCase().contains(query.toLowerCase()))
            .toList(); // Filter recipes by name
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(height: h * 0.04),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  child: TextFieldWidget(onChanged: _searchRecipes), // Search bar
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: _filteredRecipes.length,
                    itemBuilder: (context, index) {
                      final recipe = _filteredRecipes[index];
                      return GestureDetector(
                        onTap: () async {
                          // Fetch detailed information when tapped
                          final details = await RecipesApi.getRecipeDetails(recipe.id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipeDetails(recipe: details),
                            ),
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.network(recipe.images, height: h * 0.15, fit: BoxFit.cover),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  recipe.name,
                                  style: TextStyle(fontSize: w * 0.04, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
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

class RecipeDetails extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetails({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipe.images, height: h * 0.3, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              recipe.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(recipe.description ?? "No description available."),
            const SizedBox(height: 16),
            Text(
              "Ingredients:",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (recipe.ingredients != null)
              ...recipe.ingredients!.map((ingredient) => Text("- $ingredient")),
            const SizedBox(height: 16),
            Text(
              "Instructions:",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(recipe.instructions ?? "No instructions available."),
          ],
        ),
      ),
    );
  }
}

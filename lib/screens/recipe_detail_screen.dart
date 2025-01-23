import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:recipe_app/components/page_heading.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/models/recipes_api.dart';
import 'package:recipe_app/models/created_recipe.dart';

class RecipeDetailScreen extends StatefulWidget {
  final int? recipeId; // For API recipes
  final CreatedRecipe? createdRecipe; // For created recipes

  const RecipeDetailScreen({
    super.key,
    this.recipeId,
    this.createdRecipe,
  });

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  late Future<Recipe>? _recipeDetails;

  @override
  void initState() {
    super.initState();
    if (widget.recipeId != null) {
      _recipeDetails = RecipesApi.getRecipeDetails(widget.recipeId!);
    } else {
      _recipeDetails = null; // No API call for created recipes
    }
  }

  List<Widget> _parseHtml(String htmlString) {
    final document = parse(htmlString);
    final List<Widget> widgets = [];

    document.body?.children.forEach((element) {
      if (element.localName == 'ol') {
        widgets.add(Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: element.children.map((li) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("• "),
                  Expanded(child: Text(li.text.trim())),
                ],
              );
            }).toList(),
          ),
        ));
      } else if (element.localName == 'p') {
        widgets.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            element.text.trim(),
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
        ));
      }
    });

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, h * .04, 0, h * .04),
        child: Column(
          children: [
            const PageHeading(),
            widget.createdRecipe != null
                ? _buildCreatedRecipeDetails(widget.createdRecipe!)
                : FutureBuilder<Recipe>(
                    future: _recipeDetails,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      } else if (!snapshot.hasData) {
                        return const Center(child: Text("No details available"));
                      } else {
                        final recipe = snapshot.data!;
                        return _buildApiRecipeDetails(recipe);
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildApiRecipeDetails(Recipe recipe) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(recipe.images, fit: BoxFit.cover),
          const SizedBox(height: 16),
          Text(recipe.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Text("Instructions:", style: Theme.of(context).textTheme.titleMedium),
          ..._parseHtml(recipe.instructions ?? "<p>No instructions provided.</p>"),
        ],
      ),
    );
  }

  Widget _buildCreatedRecipeDetails(CreatedRecipe createdRecipe) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(createdRecipe.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          Text(
            "Ingredients:",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            createdRecipe.ingredients,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 16),
          Text(
            "Instructions:",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            createdRecipe.instructions,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }
}

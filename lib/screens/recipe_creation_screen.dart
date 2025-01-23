import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/providers/favorites_provider.dart';

class RecipeCreationScreen extends StatefulWidget {
  @override
  _RecipeCreationScreenState createState() => _RecipeCreationScreenState();
}

class _RecipeCreationScreenState extends State<RecipeCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  String recipeName = '';
  String ingredients = '';
  String instructions = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Recipe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Recipe Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a recipe name';
                  }
                  return null;
                },
                onSaved: (value) {
                  recipeName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Ingredients"),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ingredients';
                  }
                  return null;
                },
                onSaved: (value) {
                  ingredients = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Instructions"),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter instructions';
                  }
                  return null;
                },
                onSaved: (value) {
                  instructions = value!;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      final newRecipe = Recipe(
                        id: DateTime.now().millisecondsSinceEpoch,
                        name: recipeName,
                        images:
                            'https://cdni.iconscout.com/illustration/premium/thumb/food-recipe-illustration-download-in-svg-png-gif-file-formats--world-book-day-baking-cookies-mixing-ingredients-cooking-healthy-pack-people-illustrations-4055254.png?f=webp', // Placeholder for image (can be extended later)
                        description: '',
                        ingredients: ingredients.split(','),
                        instructions: instructions,
                      );

                      Provider.of<FavoritesProvider>(context, listen: false)
                          .addCreatedRecipe(newRecipe);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Recipe created successfully!")),
                      );
                      Navigator.pop(context); // Close the form after saving
                    }
                  },
                  child: Text("Save Recipe"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

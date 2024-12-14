import 'package:flutter/material.dart';
import 'ingredient_recipe_list_screen.dart';

class IngredientInputScreen extends StatefulWidget {
  @override
  _IngredientInputScreenState createState() => _IngredientInputScreenState();
}

class _IngredientInputScreenState extends State<IngredientInputScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _ingredients = [];

  void _addIngredient() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _ingredients.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _searchRecipes() {
    if (_ingredients.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              IngredientRecipeListScreen(ingredients: _ingredients),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Ingredients"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter an ingredient",
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addIngredient,
                ),
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              children: _ingredients
                  .map((ingredient) => Chip(
                        label: Text(ingredient),
                        onDeleted: () {
                          setState(() {
                            _ingredients.remove(ingredient);
                          });
                        },
                      ))
                  .toList(),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: _searchRecipes,
              child: Text("Search Recipes"),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFFeb4600)),
            ),
          ],
        ),
      ),
    );
  }
}

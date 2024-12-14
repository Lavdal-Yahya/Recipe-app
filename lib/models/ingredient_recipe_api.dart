import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ingredient_recipe.dart';

class IngredientRecipesApi {
  static const String apiKey = "e8b8513c2d734c3a81879b6780fd1128"; // Replace with your API key
  static const String baseUrl = "api.spoonacular.com";

  static Future<List<IngredientRecipe>> getRecipesByIngredients(List<String> ingredients) async {
    var uri = Uri.https(
      baseUrl,
      "/recipes/findByIngredients",
      {
        "ingredients": ingredients.join(","),
        "number": "10",
        "apiKey": apiKey,
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return IngredientRecipe.recipesFromSnapshot(data);
    } else {
      throw Exception("Failed to fetch recipes");
    }

    
  }
static Future<IngredientRecipe> getRecipeDetails(int recipeId) async {
  var uri = Uri.https(baseUrl, "/recipes/$recipeId/information", {
    "apiKey": apiKey,
  });

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // Explicitly cast the response body to Map<String, dynamic>
    Map<String, dynamic> data = jsonDecode(response.body);
    return IngredientRecipe.fromJson(data);
  } else {
    throw Exception("Failed to fetch recipe details");
  }
}

}

